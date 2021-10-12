<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require_once 'vendor/autoload.php';
use Jasny\SSO\Broker;
use Jasny\SSO\NotAttachedException;

class Authbc {
    private $_baseurl =  'https://patops.bcsoetta.org/';
    private $_edcurl = 'https://ecdpatops-dev.bcsoetta.org/';
    private $_users = array();
    
    public function __construct() { 
    }
    
    private function connectSSO() {
        // config SSO utk aplikasi ini
        $sso_url = 'https://ssoserv.bcsoetta.org/';
        $sso_app_id = '15';
        $sso_app_secret = 'q93k27vzy';

        // create new instance dari SSO Client
        $sso = new Broker(
            $sso_url,
            $sso_app_id,
            $sso_app_secret,
            36000
        );

        $sso->attach($this->_edcurl);
        // return method
        $return = false;
        
        try {
            /**
             * only for login
             */
            /*
            $userInfo = $sso->login(
                'dummy',    // username 
                '123456'    // password
            );
            */

            $userInfo = $sso->getUserInfo();
            if ($userInfo) {
                /**
                 * check is have access?
                 */
                $result = $userInfo;
                
                if (!isset($result['apps_data']['15'])) {
                    // echo "<script type='text/javascript'>alert('Sorry, You have no access to this app');</script>";
                    // header('location: https://intra.bcsoetta.org');
                    header('location: ' . $this->_baseurl);
                } else {
                    $this->_users = $userInfo;
                    $return = true;
                }
                // echo json_encode($userInfo);
                // print_r($result);
            } else {
                header('location: ' . $this->_baseurl);
            }   
        } catch (NotAttachedException $e) {
            // exception handling apabila attach (proses konek pertama kali ke sso server gagal)
            // die("Cannot connect to SSO server, please try again later!");
        } catch (\Exception $e) {
            // exception handling untuk error lain
            // die("Cannot connect to SSO server, please try again later!");
        }

        return $return;
    }

    private function offline_users() {
		$users = array(
			'name' => 'Robbi Amirudin',
			'nip' => '123123123123123123',
			'pangkat' => 'Penata Muda - III a'
		);

		$this->_users = $users;
	}

    public function get_users() {
        /**
         * for offline mode
         */
        // $this->offline_users();
        // for online mode
        // uncomment this line below
        
        $sso = $this->connectSSO();

        if ($sso) {
        } else {
            $this->offline_users();  
        }

        return $this->_users;
    }
}
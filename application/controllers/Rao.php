<?php date_default_timezone_set("Asia/Bangkok");

defined('BASEPATH') OR exit('No direct script access allowed');
class Rao extends MY_Controller {
    public function __construct(){
		parent::__construct();
		// $this->load->model('ecd_model');
	}

    public function index(){
		$data['users'] = $this->auth();
		$data['menuActive'] = 7;
		
        $this->page->template('ecd/index');
		$this->page->view('ecd/index', $data);
	}
}
<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Ecd_model extends CI_Model {
    // zone 0 is green, 1 is red
    // scan status 0 = no, 1 yes
    public function search($params) {
        $this->db->select('A.id AS ecdID, A.full_name, A.date_of_birth, A.passport_number,  A.flight_number, A.scan_status,
            A.zone
        ');
        $this->db->from('ecd_personal A');

        // search parameter
        if (!empty($params['date'])) {
            // $this->db->where('A.arrival_date', $params['date']);
        }
        $this->db->order_by('A.created_at', 'DESC');
        // set for pagination
        // limit +1 for next page indicator
        $limit = 20;
        $offset = ($params['page'] - 1) * $limit;

        $this->db->limit($limit + 1);
        $this->db->offset($offset);

        $result = array(
			'rows' => array(),
			'nav' => array(
				'page' => $params['page'],
				'last' => TRUE
			)
        );

        foreach ($this->db->get()->result_array() as $index => $row) {
            if ($index < $limit) {
                $result['rows'][$index] = array(
                    'ecd' => $row['ecdID'],
                    'name' => $row['full_name'],
                    'birth' => date('d/m/Y', strtotime($row['date_of_birth'])),
                    'passport' => $row['passport_number'],
                    'flight' => $row['flight_number'],
                    'scan' => $row['scan_status'],
                    'zone' => $row['zone'],
                );
            } else {
                $result['nav']['last'] = FALSE;
				break;
            }
        }

        return $result;
    }

    public function get_detail($val) {
        $result = array();
        $this->db->select('A.*, B.name AS nationality');
        $this->db->join('countries B', 'B.id = A.nationality');
        $this->db->where('A.id', $val['headerID']);
        $data = $this->db->get('ecd_personal A')->row_array();
        // goods
        $this->db->where('personal_id', $data['id']);
        $goods = $this->db->get('ecd_goods')->result_array();
        // family
        $this->db->where('personal_id', $data['id']);
        $fams = $this->db->get('ecd_personal_family')->result_array();

        $arrival_date = explode('-', $data['arrival_date']);
        $new_arrival = $arrival_date[2] . ' ' . get_month($arrival_date[1]) . ' ' . $arrival_date[0]; 
        $result = array(
            'name' => $data['full_name'],
            'nationality' => $data['nationality'],
            'birth' => date('d/m/Y', strtotime($data['date_of_birth'])),
            'occupation' => $data['occupation'],
            'passport' => $data['passport_number'],
            'address' => $data['address_in_indo'],
            'flight' => $data['flight_number'],
            'arrival' => $new_arrival,
            'baggage_in' => $data['baggage_in'],
            'baggage_ex' => $data['baggage_ex'],
            'scanned' => $data['scan_status'],
            'zone' => $data['zone'],
            'goods' => $goods,
            'family' => $fams
        );
        
        return $result;
    }
 
} 
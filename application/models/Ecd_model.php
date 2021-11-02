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
            $this->db->where('A.arrival_date', $params['date']);
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

} 
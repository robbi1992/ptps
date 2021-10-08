<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Import_model extends CI_Model {

    /**
     * bpj status
     * <= 14 days is red
     * 15 - 60 is yellow
     * 61 - 90 is green
     */
    private function bpj_status($doc_date, $periode) {
        $now = time(); // or your date as well
        $your_date = strtotime($doc_date);
        $datediff = $now - $your_date;

        $bpj = round($datediff / (60 * 60 * 24));
        $bpj_status = $periode - $bpj;
        return $bpj_status;
    }

    private function identity_type($id) {
        $type = array(
            '1' => 'NPWP',
            '2' => 'KTP',
            '3' => 'Paspor'
        );

        return isset($type[$id]) ? $type[$id] : '';
    }

    private function return_type($id) {
        $type = array(
            '1' => 'Diambil Sendiri',
            '2' => 'Transfer Bank',
            '3' => 'Sponsor'
        );

        return isset($type[$id]) ? $type[$id] : '';
    }

    public function change_status($header_id) {
        $this->db->set('status', 2);
        $this->db->where('id', $header_id);
        $this->db->update('import');
    }

    public function get_office() {
        return $this->db->get('office')->result_array();
    }

    public function get_package() {
        return $this->db->get('quantity_type')->result_array();
    }

    public function get_categories() {
        return $this->db->get('item_categories')->result_array();
    }

    public function search($params) {
        $this->db->select('A.id AS importID, A.doc_number, A.doc_date, A.name, A.passport,  A.status, A.periode
        ');
        $this->db->from('import A');
        // data not deleted
        $this->db->where('A.is_deleted', '0');
        // search parameter
        if (!empty($params['dateFrom'])) {
            $this->db->where('A.doc_date >=', $params['dateFrom']);
        }
        if (!empty($params['dateUntil'])) {
            $this->db->where('A.doc_date <=', $params['dateUntil']);
        }
        if (!empty($params['docNumber'])) {
            // search by doc number / passenger name or origin country
            $this->db->group_start()
                ->like('A.doc_number', $params['docNumber'])
                ->or_like('A.name', $params['docNumber'])
                ->group_end();
        }

        // set for pagination
        // limit +1 for next page indicator
        $limit = 10;
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
                    'import' => $row['importID'],
                    'docNumber' => $row['doc_number'],
                    'docDate' => $row['doc_date'],
                    'name' => $row['name'],
                    'passport' => $row['passport'],
                    // 'flightNumber' => $row['flight_number'],
                    'status' => $row['status'],
                    'bpjStatus' => $this->bpj_status($row['doc_date'], $row['periode']),
                    'periode' => $row['periode']
                );
            } else {
                $result['nav']['last'] = FALSE;
				break;
            }
        }

        return $result;

    }

    public function create_new($params, $keys) {
        $return_status = TRUE;

        $this->db->trans_start();
        // insert header first
        $personal = $params['personal'];
        $this->db->set('name', $personal['name']);
        $this->db->set('doc_date', date('Y-m-d'));
        $this->db->set('identity_type', $personal['identityType']);
        $this->db->set('address', $personal['address']);
        $this->db->set('passport', $personal['identity']);
        $this->db->set('periode', $personal['periode']);
        $this->db->set('return_type', $personal['returnGuarantee']);
        $this->db->set('airport_in', $personal['airportIn']);
        $this->db->set('airport_out', $personal['airportOut']);
        $this->db->set('inv_number', $personal['invNumber']);
        $this->db->set('inv_date', $personal['invDate']);
        $this->db->set('inv_date_out', $personal['invDateOut']);
        $this->db->set('inv_number', $personal['invNumber']);
        $this->db->set('carrier_info', $personal['carrierName']);
        $this->db->set('officer_name', $_SESSION['users']['name']);
        $this->db->set('officer_nip', $_SESSION['users']['nip']);
        $this->db->insert('import');
        $header_id = $this->db->insert_id();

        // insert to table account
        $this->db->set('name', $personal['accountName']);
        $this->db->set('number', $personal['accountNumber']);
        $this->db->set('bank', $personal['accountBank']);
        $this->db->set('header_id', $header_id);
        $this->db->insert('import_account');

        // insert to table sponsor
        $this->db->set('name', $personal['sponsName']);
        $this->db->set('address', $personal['sponsAddress']);
        $this->db->set('phone', $personal['sponsPhone']);
        $this->db->set('identity_number', $personal['sponsNik']);
        $this->db->set('location', $personal['sponsLocation']);
        $this->db->set('reason', $personal['sponsReason']);
        $this->db->set('header_id', $header_id);
        $this->db->insert('import_sponsor');

        // insert to table guarantee
        $guar = $params['guarantee'];
        $this->db->set('type', $guar['guaranteeType']);
        $this->db->set('name', $guar['guaranteeName']);
        $this->db->set('address', $guar['guaranteeAddress']);
        $this->db->set('nominal', $guar['guaranteeNominal']);
        $this->db->set('header_id', $header_id);
        $this->db->insert('import_guarantee');

        // insert to items from temp
        $this->db->where('key_header', $keys['header']);
        $data_temp = $this->db->get('import_items_temp')->result_array();

        if (count($data_temp) > 0) {
            foreach ($data_temp as $val) {
                $this->db->set('name', $val['name']);
                $this->db->set('quantity', $val['quantity']);
                $this->db->set('bruto', $val['bruto']);
                $this->db->set('package_type', $val['package_type']);
                $this->db->set('description', $val['description']);
                $this->db->set('currency', $val['currency']);
                $this->db->set('kurs', $val['kurs']);
                $this->db->set('fob', $val['fob']);
                $this->db->set('freight', $val['freight']);
                $this->db->set('insurance', $val['insurance']);
                $this->db->set('cif', $val['cif']);
                $this->db->set('bm_tax', $val['bm_tax']);
                $this->db->set('ppn_tax', $val['ppn_tax']);
                $this->db->set('pph_tax', $val['pph_tax']);
                $this->db->set('ppnbm_tax', $val['ppnbm_tax']);
                $this->db->set('header_id', $header_id);
                $this->db->insert('import_items');

                $item_id = $this->db->insert_id();

                // insert items attachment from temp
                $this->db->where('key_item', $val['key_item']);
                $file_temp = $this->db->get('import_items_attachment_temp')->result_array();
                if (count($file_temp) > 0) {
                    $data_file = array();
                    foreach ($file_temp as $row) {
                        $data_file[] = array(
                            'name' => $row['name'],
                            'item_id' => $item_id
                        );
                    }

                    $insert_file = $this->db->insert_batch('import_items_attachment', $data_file);
                    if ($insert_file) {
                        // remove file temp after inserted
                        $this->db->where('key_item', $val['key_item']);
                        $this->db->delete('import_items_attachment_temp');
                    }
                }
            }
        }

        // remove items from temp after inserted
        $this->db->where('key_header', $keys['header']);
        $this->db->delete('import_items_temp');

        $doc_number  = $header_id . '/IS/T/KPU.03/' . date('Y');
        $this->db->where('id', $header_id);
        $this->db->set('doc_number', $doc_number);
        $this->db->update('import');

        $this->db->trans_complete();
        if ($this->db->trans_status() === FALSE)
		{
			$return_status = FALSE;
		}

        return $return_status;
    }

    public function save_item_temp($val) {
        $dataItems = array(
            'name' => $val['name'],
            'quantity' => $val['quantity'],
            'bruto' => $val['bruto'],
            'package_type' => $val['package'],
            'currency' => $val['currency'],
            'kurs' => $val['kurs'],
            'fob' => $val['fob'],
            'freight' => $val['freight'],
            'insurance' => $val['insurance'],
            'cif' => $val['cif'],
            'bm_tax' => $val['pabeanIn'],
            'ppn_tax' => $val['ppn'],
            'pph_tax' => $val['pph'],
            'ppnbm_tax' => $val['ppnbm'],
            'key_header' => $val['keyHeader'],
            'key_item' => $val['keyItem']
        );

        return $this->db->insert('import_items_temp', $dataItems);
    }

    public function save_item_attachment_temp($fileName, $key) {
        $this->db->set('name', $fileName);
        $this->db->set('key_item', $key);
        $this->db->insert('import_items_attachment_temp');
    }

    public function get_detail($header_id) {
        $result = array(
            'header' => array(),
            'items' => array(),
            'account' => array()
        );
        
        $this->db->select('A.doc_number, A.identity_type, A.doc_date, A.name, A.address, A.passport, A.periode, A.inv_number,
            A.return_type, B.name AS airport_in, C.name AS airport_out, A.inv_date, A.carrier_info, A.periode
        ');
        $this->db->from('import A');
        $this->db->join('office B', 'A.airport_in = B.id');
        $this->db->join('office C', 'A.airport_out = C.id');
        $this->db->where('A.id', $header_id);
        $data_header = $this->db->get()->row_array();
        $header = array(
            'doc' => $data_header['doc_number'],
            'identity_type' => $this->identity_type($data_header['identity_type']),
            'doc_date' => $data_header['doc_date'],
            'name' => $data_header['name'],
            'address' => $data_header['address'],
            'identity_number' => $data_header['passport'],
            'periode' => $data_header['periode'],
            'return_type' => $this->return_type($data_header['return_type']),
            'airport_in' => $data_header['airport_in'],
            'airport_out' => $data_header['airport_out'],
            'inv_number' => $data_header['inv_number'],
            'inv_date' => $data_header['inv_date'],
            'carrier' => $data_header['carrier_info'],
            'periode' => $data_header['periode']
        );
        // account
        $this->db->select('name, number, bank');
        $this->db->where('header_id', $header_id);
        $account = $this->db->get('import_account')->row_array();

        $this->db->select('A.id AS item_id, A.name, A.quantity, A.bruto, A.description, B.name AS package');
        $this->db->from('import_items A');
        $this->db->join('quantity_type B', 'A.package_type = B.id');
        $this->db->where('A.header_id', $header_id);
        $data_items = $this->db->get()->result_array();
        $items = array();
        $items_key = array();
        foreach ($data_items as $val) {
            $items_key[] = $val['item_id'];

            $items[$val['item_id']] = array(
                'item' => $val['item_id'],
                'name' => $val['name'],
                'qty' => $val['quantity'],
                'bruto' => $val['bruto'],
                'desc' => $val['description'],
                'type' => $val['package'],
                'attachments' => array()
            );
        }
        // get attachments
        if (count($items) > 0) {
            $this->db->where_in('item_id', $items_key);
            $attachs = $this->db->get('import_items_attachment')->result_array();
            
            foreach($attachs as $val) {
                $items[$val['item_id']]['attachments'][] = array(
                    'name' => $val['name']
                );
            }
        }

        $result['header'] = $header;
        $result['items'] = array_values($items);
        $result['account'] = $account;
        return $result;
    }

    public function get_data_print($header_id) {
        $data = array();
        $this->db->select('A.doc_number, A.identity_type, A.doc_date, A.name, A.address, A.passport, A.officer_name, A.officer_nip,
            A.carrier_info, B.name AS airport_in, C.name AS airport_out, A.return_type
        ');
        $this->db->from('import A');
        $this->db->join('office B', 'A.airport_in = B.id');
        $this->db->join('office C', 'A.airport_out = C.id');    
        $this->db->where('A.id', $header_id);
        $data['header'] = $this->db->get()->row();

        // get guarantee
        $this->db->select('type, name, address, nominal');
        $this->db->where('header_id', $header_id);
        $data['warrant'] = $this->db->get('import_guarantee')->row();
        
        // get account
        $this->db->select('name, number, bank');
        $this->db->where('header_id', $header_id);
        $data['account'] = $this->db->get('import_account')->row();

        return $data;
    }  

}
<!DOCTYPE html>
<html lang="en">
    <head>
        <style>
            @media print {
                .pagebreak { page-break-before: always; } /* page-break-after works, as well */
            } 
            .center {
                text-align: center;
            }
            .right {
                text-align: right;
            }
            .left {
                text-align: right;
            }
            .space {
                border-left: 1px solid;
                border-right: 1px solid;
                border-bottom: 1px solid;
                height: 20px;
                width: 100%;
            }
            .my-table {
                border-left: 1px solid;
                border-right: 1px solid;
                border-bottom: 1px solid;
                width: 100%;
                font-size: 12px;
            }
            .my-border {
                border: 1px solid;
                padding: 5px 5px 5px 5px;
            }
            .verticalText {
                text-align: center;
                transform: rotate(270deg);
            }

        </style>
    </head>
    <body>
        <table style="font-size: 14px; width: 100%;">
            <tr>
                <td colspan="2">&nbsp;</td>
            </tr>
            <tr>
                <td colspan="2" style="font-size: 12px; text-align: center;"><b>FORMULIR IMPOR SEMENTARA<br />
                    BARANG PRIBADI PENUMPANG DAN BARANG PRIBADI AWAK SARANA PENGANGKUT
                    </b>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <table class="my-table" style="border-top: 1px solid;">
                        <tr>
                            <td colspan="9" style="text-align: right">Halaman 1 dari ...</td>
                        </tr>
                    </table>
                    <table class="my-table">
                        <tr>
                            <td width="5%">A.</td>
                            <td width="45%" colspan="4" style="border-right: 1px solid;">DATA PEMBERITAHU</td>
                            <td width="5%">G.</td>
                            <td width="45%" colspan="3">KOLOM KHUSUS BEA DAN CUKAI</td>
                        </tr>
                        <tr>
                            <td width="5%">&nbsp;</td>
                            <td width="5%">1.</td>
                            <td width="15%">Nama Lengkap</td>
                            <td width="5%">:</td>
                            <td width="20%" style="border-right: 1px solid;"><?= $header->name;?></td>
                            <td width="5%">&nbsp;</td>
                            <td width="15%">Nomor</td>
                            <td width="5%">:</td>
                            <td width="25%"><?= $header->doc_number;?></td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>2.</td>
                            <td>Alamat Lengkap</td>
                            <td>:</td>
                            <td style="border-right: 1px solid;"><?= $header->address;?></td>
                            <td>&nbsp;</td>
                            <td>Tanggal</td>
                            <td>:</td>
                            <td><?= $header->doc_date;?></td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>3.</td>
                            <td>Nomor Paspor</td>
                            <td>:</td>
                            <td style="border-right: 1px solid;"><?= $header->passport;?></td>
                            <td colspan="4">&nbsp;</td>
                        </tr>
                        <tr>
                            <td style="border-top: 1px solid;">B.</td>
                            <td style="border-top: 1px solid; border-right: 1px solid;" colspan="4">DATA SPONSOR</td>
                            <td style="border-top: 1px solid;">10.</td>
                            <td style="border-top: 1px solid;">Invoice No</td>
                            <td style="border-top: 1px solid;">:</td>
                            <td style="border-top: 1px solid; text-align: center;">Tgl.</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>4.</td>
                            <td>Nama Lengkap</td>
                            <td>:</td>
                            <td style="border-right: 1px solid;">&nbsp;</td>
                            <td colspan="4">&nbsp;</td>
                        </tr>
                        <tr>
                            <td >&nbsp;</td>
                            <td >5.</td>
                            <td >Alamat di Indonesia</td>
                            <td >:</td>
                            <td style="border-right: 1px solid;">&nbsp;</td>
                            <td style="vertical-align: top; border-top: 1px solid;">11.</td>
                            <td style="border-top: 1px solid;">Nama Sarana Pengangkut & No. Voy/Flight</td>
                            <td style="border-top: 1px solid;">:</td>
                            <td style="border-top: 1px solid;" colspan="2"><?=$header->carrier_info;?></td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>6.</td>
                            <td>Nomor Telepon</td>
                            <td>:</td>
                            <td style="border-right: 1px solid;">&nbsp;</td>
                            <td style="vertical-align: top; border-top: 1px solid;">12.</td>
                            <td style="border-top: 1px solid;">Perkiraan Tanggal Keluar</td>
                            <td style="border-top: 1px solid;">:</td>
                            <td style="border-top: 1px solid;" colspan="2">Tanggal Keluar</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>7.</td>
                            <td>Nomor Identitas</td>
                            <td>:</td>
                            <td style="border-right: 1px solid;"></td>
                            <td colspan="4">&nbsp;</td>
                        </tr>
                        <tr>
                            <td style="border-top: 1px solid;">C.</td>
                            <td style="border-top: 1px solid; border-right: 1px solid;" colspan="4">DATA PENGGUNAAN BARANG</td>
                            <td style="border-top: 1px solid;">13.</td>
                            <td style="border-top: 1px solid;">Pelabuhan Masuk</td>
                            <td style="border-top: 1px solid;">:</td>
                            <td style="border-top: 1px solid; text-align: center;"><?=$header->airport_in;?></td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>8.</td>
                            <td>Lokasi Penggunaan</td>
                            <td>:</td>
                            <td style="border-right: 1px solid;">&nbsp;</td>
                            <td colspan="4">&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>9.</td>
                            <td>Tujuan Penggunaan</td>
                            <td>:</td>
                            <td style="border-right: 1px solid;">&nbsp;</td>
                            <td style="vertical-align: top; border-top: 1px solid;">14.</td>
                            <td style="border-top: 1px solid;">Pelabuhan Keluar</td>
                            <td style="border-top: 1px solid;">:</td>
                            <td style="border-top: 1px solid; text-align: center;"><?=$header->airport_in;?></td>
                        </tr>
                    </table>
                    <table class="my-table">
                        <tr>
                            <td width="5%">D.</td>
                            <td width="45%" colspan="4" style="border-right: 1px solid;">PENGEMBALIAN JAMINAN</td>
                            <td width="5%">16.</td>
                            <td width="45%" colspan="3">Rekening</td>
                        </tr>
                        <tr>
                            <td width="5%">&nbsp;</td>
                            <td width="5%">15.</td>
                            <td width="15%">Melalui : </td>
                            <td width="5%" class="center" style="border: 1px solid;"><?=$header->return_type;?></td>
                            <td width="20%" style="border-right: 1px solid;">1. Diambil Sendiri</td>
                            <td width="5%">&nbsp;</td>
                            <td width="15%">Nomor</td>
                            <td width="5%">:</td>
                            <td width="25%"><?=$account->number;?></td>
                        </tr>
                        <tr>
                            <td width="5%">&nbsp;</td>
                            <td width="5%">&nbsp;</td>
                            <td width="15%">&nbsp;</td>
                            <td width="5%">&nbsp;</td>
                            <td width="20%" style="border-right: 1px solid;">2. Sponsor</td>
                            <td width="5%">&nbsp;</td>
                            <td width="15%">Atas Nama</td>
                            <td width="5%">:</td>
                            <td width="25%"><?=$account->name;?></td>
                        </tr>
                        <tr>
                            <td width="5%">&nbsp;</td>
                            <td width="5%">&nbsp;</td>
                            <td width="15%">&nbsp;</td>
                            <td width="5%">&nbsp;</td>
                            <td width="20%" style="border-right: 1px solid;">3. Transfer Rekening</td>
                            <td width="5%">&nbsp;</td>
                            <td width="15%">Bank</td>
                            <td width="5%">:</td>
                            <td width="25%"><?=$account->bank;?></td>
                        </tr>
                    </table>
                    <table class="my-table">
                        <tr>
                            <td colspan="5" style="border-bottom: 1px solid;">E. DATA BARANG</td>
                        </tr>
                        <tr>
                            <td>17. No</td>
                            <td>18. Uraian Barang</td>
                            <td>19. Spesifikasi / Identitas Barang</td>
                            <td>20. Jumlah dan Jenis Satuan</td>
                            <td>21. Perkiraan Nilai Barang (CIF)</td>
                        </tr>
                    </table>
                    <?php
                    $created = explode(' ', $header->created_at);
                    $time = time($created[0]);
                    $created_date = date('d-m-Y', $time);
                    $array_date = explode('-', $created_date);
                    $new_date = $array_date[0] . ' ' . get_month($array_date[1]) . ' ' . $array_date[2];
                    ?>
                    <table class="my-table">
                        <tr>
                            <td width="5%" style="vertical-align: top;" rowspan="4">F.</td>
                            <td width="45%" class="center" rowspan="4" style="border-right: 1px solid;">Dengan ini saya menyatakan bertanggung jawab atas
                                kebenaran hal-hal yang diberitahukan dalam dokumen ini <br />
                                Jakarta, Tgl <?= $new_date; ?><br />
                                Pemohon <br /><br />

                                (<?= $header->name; ?>)
                            </td>
                            <td style="border-bottom: 1px solid;" width="10%">22. Valuta</td>
                            <td style="border-bottom: 1px solid;" width="5%">:</td>
                            <td style="border-bottom: 1px solid;" width="10%" style="border-right: 1px solid;"></td>
                            <td style="border-bottom: 1px solid;" width="10%">23. NDPBM</td>
                            <td style="border-bottom: 1px solid;" width="5%">:</td>
                            <td style="border-bottom: 1px solid;" width="10%" style="border-right: 1px solid;"></td>
                        </tr>
                        <tr>
                            <td style="border-bottom: 1px solid;" width="10%">24. FOB</td>
                            <td style="border-bottom: 1px solid;" width="5%">:</td>
                            <td style="border-bottom: 1px solid;" width="10%" style="border-right: 1px solid;"></td>
                            <td style="border-bottom: 1px solid;" width="10%">25. Freight</td>
                            <td style="border-bottom: 1px solid;" width="5%">:</td>
                            <td style="border-bottom: 1px solid;" width="10%" style="border-right: 1px solid;"></td>
                        </tr>
                        <tr>
                            <td style="border-bottom: 1px solid;" width="10%">26. Asuransi</td>
                            <td style="border-bottom: 1px solid;" width="5%">:</td>
                            <td style="border-bottom: 1px solid;" width="10%" style="border-right: 1px solid;"></td>
                            <td style="border-bottom: 1px solid;" width="10%">27. CIF</td>
                            <td style="border-bottom: 1px solid;" width="5%">:</td>
                            <td style="border-bottom: 1px solid;" width="10%" style="border-right: 1px solid;"></td>
                        </tr>
                        <tr>
                            <td width="10%">28. Rp</td>
                            <td width="5%">:</td>
                            <td width="35%" colspan="4"></td>
                        </tr>
                    </table>
                    <table class="my-table">
                        <tr>
                            <td colspan="6" style="border-bottom: 1px solid;">H. HASIL PEMERIKSAAN/PENETAPAN PEJABAT BEA DAN CUKAI PELABUHAN PEMASUKAN</td>
                        </tr>
                        <tr>
                            <td width="5%" style="border-bottom: 1px solid; border-right: 1px solid;">29. No</td>
                            <td width="45%" style="border-bottom: 1px solid; border-right: 1px solid;">30. Uraian barang secara lengkap meliputi jenis,jumlah, merek, tipe, ukuran, dan spesifikasi lainnya</td>
                            <td width="15%" style="border-bottom: 1px solid; border-right: 1px solid;">31. Nilai Pabean</td>
                            <td width="5%" style="border-bottom: 1px solid;">32.</td>
                            <td width="15%" style="border-bottom: 1px solid; border-right: 1px solid;">- Pos Tarif / HS <br /> - Tarif BM, Cukai, PPn, PPh, PPnBM</td>
                            <td width="15%" style="border-bottom: 1px solid;">33. Dalam Rupiah (Rp)</td>
                        </tr>
                        <tr>
                            <td style="border-right: 1px solid;" rowspan="5"></td>
                            <td style="border-right: 1px solid;" rowspan="5"></td>
                            <td style="border-right: 1px solid;" rowspan="5"></td>
                            <td rowspan="5"></td>
                            <td style="border-right: 1px solid;" rowspan="5"></td>
                            <td style="border-bottom:1px solid;">33. BM :</td>
                        </tr>
                        <tr>
                            <td style="border-bottom:1px solid;">34. PPN :</td>
                        </tr>
                        <tr>
                            <td style="border-bottom:1px solid;">35. PPnB :</td>
                        </tr>
                        <tr>
                            <td style="border-bottom:1px solid;">36. PPh :</td>
                        </tr>
                        <tr>
                            <td style="border-bottom:1px solid;">37. Total :</td>
                        </tr>
                    </table>
                    <table class="my-table">
                        <tr>
                            <td widht="30%" style="border-right: 1px solid;">38. Bukti Penerimaan Jaminan (BPJ) No. :</td>
                            <td widht="15%" style="border-right: 1px solid;">Tanggal :</td>
                            <td widht="50%">39. Jangka Waktu Izin Impor Sementara</td>
                        </tr>
                    </table>
                    <table class="my-table">
                        <tr>
                            <td width="50%" style="border-right: 1px solid;">
                                Jakarta, Tgl <?= $new_date; ?><br />
                                Pejabat Bea dan Cukai
                                <br /><br />
                                Nama&nbsp;&nbsp;&nbsp;: <?= $header->officer_name; ?><br />
                                NIP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: <?= $header->officer_nip; ?>
                            </td>
                            <td width="50%" style="vertical-align: top;">I. CATATAN PEJABAT BEA DAN CUKAI</td>
                        </tr>
                    </table>
                    <table class="my-table">
                        <tr>
                            <td colspan="6" style="border-bottom: 1px solid;">J. UNTUK PEJABAT BEA DAN CUKAI PELABUHAN PENGELUARAN</td>
                        </tr>
                        <tr>
                            <td width="5%">40.</td>
                            <td width="10%">Kantor</td>
                            <td width="5%">:</td>
                            <td width="30%" style="border-right: 1px solid;">&nbsp;</td>
                            <td width="5%">K.</td>
                            <td width="45%">CATATAN PEJABAT BEA DAN CUKAI</td>
                        </tr>
                        <tr>
                            <td width="5%">41.</td>
                            <td width="10%">Nomor</td>
                            <td width="5%">:</td>
                            <td width="30%" style="border-right: 1px solid;">&nbsp;</td>
                            <td width="50%" colspan="2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td style="border-bottom: 1px solid;" width="5%">42.</td>
                            <td style="border-bottom: 1px solid;" width="10%">Tanggal</td>
                            <td style="border-bottom: 1px solid;" width="5%">:</td>
                            <td style="border-bottom: 1px solid; border-right: 1px solid;" width="30%">&nbsp;</td>
                            <td width="50%" colspan="2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="3">Jakarta, Tgl <?= $new_date; ?></td>
                            <td style="border-right: 1px solid;">&nbsp;</td>
                            <td colspan="2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="3">Pejabat Bea dan Cukai</td>
                            <td style="border-right: 1px solid;">&nbsp;</td>
                            <td colspan="2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="3">&nbsp;</td>
                            <td style="border-right: 1px solid;">&nbsp;</td>
                            <td colspan="2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="3">Nama&nbsp;&nbsp;&nbsp;:<?= $header->officer_name; ?></td>
                            <td style="border-right: 1px solid;">&nbsp;</td>
                            <td colspan="2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="3">NIP&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<?= $header->officer_nip; ?></td>
                            <td style="border-right: 1px solid;">&nbsp;</td>
                            <td colspan="2">&nbsp;</td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </body>
</html>
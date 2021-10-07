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
        <table width="100%" style="border: 1px solid;">
            <tr>
                <td style="border-right: 1px solid; font-size: 12px;"><b>KEMENTERIAN KEUANGAN RI</b><br />
                    Direktorat Jenderal Bea dan Cukai <br />
                    <table>
                        <tr>
                            <td>Nama Kantor</td>
                            <td>:</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>Kode Kantor</td>
                            <td>:</td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                </td>
                <td class="center" style="border-right: 1px solid; font-size:16px;">
                    <b>BUKTI PENERIMAAN JAMINAN<br /> NOMOR : <?= $header->doc_number; ?> </b>
                </td>
                <td style="font-size: 12px;">
                    <table>
                        <tr>
                            <td>Lembar ke-1</td>
                            <td>:</td>
                            <td>untuk Pihak yang menyerahkan jaminan</td>
                        </tr>
                        <tr>
                            <td>Lembar ke-2</td>
                            <td>:</td>
                            <td>untuk pengeluaran barang/disematkan pada berkas</td>
                        </tr>
                        <tr>
                            <td>Lembar ke-3</td>
                            <td>:</td>
                            <td>untuk Pejabat Bea dan Cukai/Bendahara Penerimaan</td>
                        </tr>
                    </table>
                </td>
            </tr>
        <table>
        <table class="my-table">
            <tr>
                <td width="10%">Jenis Identitas</td>
                <td width="5%">:</td>
                <td width="20%"><input type="checkbox" onclick="return false;" <?= ($header->identity_type == '1') ? 'checked' : ''; ?>> NPWP</td>
                <td width="20%"><input type="checkbox" onclick="return false;" <?= ($header->identity_type == '2') ? 'checked' : ''; ?>> KTP</td>
                <td width="20%"><input type="checkbox" onclick="return false;" <?= ($header->identity_type == '3') ? 'checked' : ''; ?>> Paspor</td>
                <td width="25%">&nbsp;</td>
            </tr>

            <tr>
                <td>Nomor</td>
                <td>:</td>
                <td colspan="4"><?= $header->passport; ?></td>
            </tr>
            <tr>
                <td>Nama</td>
                <td>:</td>
                <td colspan="4"><?= $header->name; ?></td>
            </tr>
            <tr>
                <td>Alamat</td>
                <td>:</td>
                <td colspan="4"><?= $header->address; ?></td>
            </tr>
        </table>
        <table class="my-table">
            <tr>
                <td width="10%">Bentuk Jaminan</td>
                <td width="5%">:</td>
                <td width="20%"><input type="checkbox" onclick="return false;" <?= ($warrant->type == '1') ? 'checked' : ''; ?>> Tunai</td>
                <td width="20%"><input type="checkbox" onclick="return false;" <?= ($warrant->type == '2') ? 'checked' : ''; ?>> Bank</td>
                <td width="20%"><input type="checkbox" onclick="return false;" <?= ($warrant->type == '3') ? 'checked' : ''; ?>> <i>Customs Bond</i></td>
                <td width="25%"><input type="checkbox" onclick="return false;" <?= ($warrant->type == '4') ? 'checked' : ''; ?>> Lainnya</td>
            </tr>
            <tr>
                <td>Nomor</td>
                <td>:</td>
                <td colspan="4">Nomor</td>
            </tr>
            <tr>
                <td>Tanggal</td>
                <td>:</td>
                <td colspan="4">Tanggal</td>
            </tr>
            <tr>
                <td>Penjamin</td>
                <td>:</td>
                <td colspan="4"><?= $warrant->name; ?></td>
            </tr>
            <tr>
                <td>Alamat</td>
                <td>:</td>
                <td colspan="4"><?= $warrant->address; ?></td>
            </tr>
            <tr>
                <td>Jumlah Jaminan</td>
                <td>:</td>
                <td colspan="4">Rp <?= setIDR($warrant->nominal); ?></td>
            </tr>
            <tr>
                <td>Dengan Huruf</td>
                <td>:</td>
                <td colspan="4"><?= terbilang($warrant->nominal); ?></td>
            </tr>
        </table>
        <table class="my-table">
            <tr>
                <td width="20%">Dokumen sumber penyerahan jaminan</td>
                <td width="5%">:</td>
                <td width="75%">&nbsp;</td>
            </tr>
            <tr>
                <td>Nomor</td>
                <td>:</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>Tanggal</td>
                <td>:</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <table class="my-table">
            <tr>
                <td width="30%">Catatan Pejabat Bea dan Cukai/<br /> Bendahara Penerimaan</td>
                <td width="5%">:</td>
                <td width="20%" style="border-right: 1px solid;"></td>
                <td width="45%"></td>
            </tr>
            <tr>
                <td width="30%">&nbsp;</td>
                <td width="5%">&nbsp;</td>
                <td width="20%" style="border-right: 1px solid;"></td>
                <td width="45%">Jakarta, <?= date('d m Y');?></td>
            </tr>
            <tr>
                <td width="30%">&nbsp;</td>
                <td width="5%">&nbsp;</td>
                <td width="20%" style="border-right: 1px solid;"></td>
                <td width="45%">&nbsp;</td>
            </tr>
            <tr>
                <td width="30%">&nbsp;</td>
                <td width="5%">&nbsp;</td>
                <td width="20%" style="border-right: 1px solid;"></td>
                <td width="45%">Catatan Pejabat Bea dan Cukai/<br /> Bendahara Penerimaan</td>
            </tr>
            <tr>
                <td width="30%" colspan="3" style="border-top: 1px solid; border-right: 1px solid;">Yang Menyerahkan Jaminan,</td>
                <td width="45%">&nbsp;</td>
            </tr>
            <tr>
                <td width="30%">&nbsp;</td>
                <td width="5%">&nbsp;</td>
                <td width="20%" style="border-right: 1px solid;"></td>
                <td width="45%">&nbsp;</td>
            </tr>
            <tr>
                <td width="30%">&nbsp;</td>
                <td width="5%">&nbsp;</td>
                <td width="20%" style="border-right: 1px solid;"></td>
                <td width="45%">&nbsp;</td>
            </tr>
            <tr>
                <td width="30%">&nbsp;</td>
                <td width="5%">&nbsp;</td>
                <td width="20%" style="border-right: 1px solid;"></td>
                <td width="45%">&nbsp;</td>
            </tr>
            <tr>
                <td width="30%"><?=$header->name;?></td>
                <td width="5%">&nbsp;</td>
                <td width="20%" style="border-right: 1px solid;"></td>
                <td width="45%">NIP <?= $header->officer_nip; ?></td>
            </tr>
        </table>
    </body>
</html>
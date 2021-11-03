<!DOCTYPE html>
<html lang="en">
    <?php $this->load->view('aside/head');?>
    <!--begin::Body-->
    <body id="kt_body" class="header-fixed header-mobile-fixed subheader-enabled subheader-fixed aside-enabled aside-fixed aside-minimize-hoverable page-loading">
    
    <!--begin::Main-->
        <!--begin::Header Mobile-->
        <div id="kt_header_mobile" class="header-mobile align-items-center header-mobile-fixed">
            <!--begin::Logo-->
            <a href="<?=base_url()?>">
                <img alt="Logo" src="<?=base_url('./assets/media/logos/logo-light.png')?>" />
            </a>
            <!--end::Logo-->
            <!--begin::Toolbar-->
            <div class="d-flex align-items-center">
                <!--begin::Aside Mobile Toggle-->
                <button class="btn p-0 burger-icon burger-icon-left" id="kt_aside_mobile_toggle">
                    <span></span>
                </button>
                <!--end::Aside Mobile Toggle-->
                <!--begin::Header Menu Mobile Toggle-->
                <button class="btn p-0 burger-icon ml-4" id="kt_header_mobile_toggle">
                    <span></span>
                </button>
                <!--end::Header Menu Mobile Toggle-->
                <!--begin::Topbar Mobile Toggle-->
                <button class="btn btn-hover-text-primary p-0 ml-2" id="kt_header_mobile_topbar_toggle">
                    <span class="svg-icon svg-icon-xl">
                        <!--begin::Svg Icon | path:assets/media/svg/icons/General/User.svg-->
                        <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24px" height="24px" viewBox="0 0 24 24" version="1.1">
                            <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                <polygon points="0 0 24 0 24 24 0 24" />
                                <path d="M12,11 C9.790861,11 8,9.209139 8,7 C8,4.790861 9.790861,3 12,3 C14.209139,3 16,4.790861 16,7 C16,9.209139 14.209139,11 12,11 Z" fill="#000000" fill-rule="nonzero" opacity="0.3" />
                                <path d="M3.00065168,20.1992055 C3.38825852,15.4265159 7.26191235,13 11.9833413,13 C16.7712164,13 20.7048837,15.2931929 20.9979143,20.2 C21.0095879,20.3954741 20.9979143,21 20.2466999,21 C16.541124,21 11.0347247,21 3.72750223,21 C3.47671215,21 2.97953825,20.45918 3.00065168,20.1992055 Z" fill="#000000" fill-rule="nonzero" />
                            </g>
                        </svg>
                        <!--end::Svg Icon-->
                    </span>
                </button>
                <!--end::Topbar Mobile Toggle-->
            </div>
            <!--end::Toolbar-->
        </div>
        <!--end::Header Mobile-->
        <div class="d-flex flex-column flex-root">
            <div class="d-flex flex-row flex-column-fluid page">
                <?php $this->load->view('aside/menu');?>
                <!--begin::Wrapper-->
                <div class="d-flex flex-column flex-row-fluid wrapper" id="kt_wrapper">
                    <?php $this->load->view('aside/topbar');?>
                    <!--begin::Content-->
                    <div class="content d-flex flex-column flex-column-fluid" id="kt_content">
                        <!--begin::Subheader-->
                        <div class="subheader py-2 py-lg-6 subheader-solid" id="kt_subheader">
                            <div class="container-fluid d-flex align-items-center justify-content-between flex-wrap flex-sm-nowrap">
                                <!--begin::Info-->
                                <div class="d-flex align-items-center flex-wrap mr-1">
                                    <!--begin::Page Heading-->
                                    <div class="d-flex align-items-baseline flex-wrap mr-5">
                                        <!--begin::Page Title-->
                                        <h5 class="text-dark font-weight-bold my-1 mr-5">PATOPS</h5>
                                        <!--end::Page Title-->
                                        <!--begin::Breadcrumb-->
                                        <ul class="breadcrumb breadcrumb-transparent breadcrumb-dot font-weight-bold p-0 my-2 font-size-sm">
                                            <li class="breadcrumb-item text-muted">
                                                <a href="" class="text-muted">Applcations</a>
                                            </li>
                                            <li class="breadcrumb-item text-muted">
                                                <a href="" class="text-muted">ECD</a>
                                            </li>
                                        </ul>
                                        <!--end::Breadcrumb-->
                                    </div>
                                    <!--end::Page Heading-->
                                </div>
                                <!--end::Info-->
                            </div>
                        </div>
                        <!--end::Subheader-->
                        <!--begin::Entry-->
                        <div class="d-flex flex-column-fluid">
                            <!--begin::Container-->
                            <div class="container">
                                <!--begin::Card-->
                                <div class="card card-custom">
                                    <div class="card-header">
                                        <div class="card-title">
                                            <span class="card-icon">
                                                <i class="flaticon2-supermarket text-primary"></i>
                                            </span>
                                            <h3 class="card-label">DAFTAR ATENSI PAU</h3>
                                        </div>
                                        <div class="card-toolbar">
                                            <!--begin::Button-->
                                            <!-- 
                                            <button class="btn btn-sm btn-primary" id="add_valas">
                                                <i class="fa fa-plus"></i> NEW IS
                                            </button>
                                             -->
                                            <!--end::Button-->
                                        </div>
                                    </div>
                                    <!-- end card header -->
                                    <div class="card-body">
                                        <!-- search form -->
                                        <form name="searchForm">
                                            <div class="row">
                                                <!-- 
                                                <div class="col-md-4">
                                                    <div class="form-group">
                                                        <label for="docNumber">Kata Kunci</label>
                                                        <input type="text" name="docNumber" class="form-control" id="docNumber" placeholder="Nomor/Nama/Negara" />
                                                    </div>  
                                                </div>
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label for="dateFrom">Dari</label>
                                                        <div class="input-group mb-3">
                                                            <div class="input-group-prepend">
                                                                <span class="input-group-text" id="basic-addon1"><i class="fa fa-calendar"></i></span>
                                                            </div>
                                                            <input type="text" name="dateFrom" class="form-control bc-date" id="dateFrom" />
                                                        </div>
                                                        
                                                    </div>  
                                                </div>
                                                 -->
                                                <div class="col-md-3">
                                                    <div class="form-group">
                                                        <label for="date">Tanggal</label>
                                                        <div class="input-group mb-3">
                                                            <div class="input-group-prepend">
                                                                <span class="input-group-text" id="basic-addon1"><i class="fa fa-calendar"></i></span>
                                                            </div>
                                                            <input type="text" name="date" class="form-control bc-date" id="date" value="<?= date('Y-m-d'); ?>" readonly />
                                                        </div>
                                                        
                                                    </div>  
                                                </div>
                                                <div class="col-md-2">
                                                    <!-- 
                                                    <div class="form-group">
                                                        <label>&nbsp;</label>
                                                        <button type="submit" class="btn btn-primary form-control"><i class="fa fa-search"></i></button>
                                                    </div>
                                                     -->
                                                </div>
                                            </div>
                                            <!-- end row in card header -->
                                        </form>
                                        <div class="d-none" name="searchResult">
                                            <div class="card">
                                                <table class="table table-bordered table-striped">
                                                    <thead>
                                                        <tr class="text-center">
                                                            <th>Nama</th>
                                                            <th>TTL</th>
                                                            <th>Nomor Paspor</th>
                                                            <th>Pesawat</th>
                                                            <th>Status Scan</th>
                                                            <th>Jalur</th>
                                                        </tr>
                                                        <tr class="d-none" template="searchResultRow">
                                                            <td view="name"></td>
                                                            <td view="birthDate"></td>
                                                            <td view="passport"></td>
                                                            <td view="flightNumber"></td>
                                                            <td view="status"></td>
                                                            <td view="zone"></td>
                                                        </tr>
                                                    </thead>
                                                    <tbody><!-- Appended by Ajax --></tbody>
                                                </table>
                                            </div>
                                            
                                            <div class="text-center">
                                                <div class="btn-group" role="group" name="searchNav">
                                                    <button type="button" class="btn btn-primary" name="prev"><span aria-hidden="true" class="fa fa-chevron-left"></span></button>
                                                    <button type="button" class="btn btn-default">Halaman <span name="page"></span></button>
                                                    <button type="button" class="btn btn-primary" name="next"><span aria-hidden="true" class="fa fa-chevron-right"></span></button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- end body -->
                                </div>
                                <!-- end card-->
                            </div>
                        </div>
                    </div>
                    <!-- end content -->
                    <?php $this->load->view('aside/foot');?>
                </div>
                <!-- end wrapper -->
            </div>
            <!-- end page -->
        </div>

        <!-- modal layout -->
        <!-- modal detail -->
        <div class="modal fade" id="detailModal" name="detailModal" data-backdrop="static" style="overflow: scroll !important;">
            <div class="modal-dialog modal-xl">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">Data Penumpang dan Barang</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">&times;</button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-3">
                                <div class="mb-3">
                                    <label for="fullName" class="form-label">Nama Lengkap</label>
                                    <input type="text" class="form-control" id="fullName" name="fullName" readonly />
                                </div>
                                <div class="mb-3">
                                    <label for="birth" class="form-label">Tanggal Kelahiran</label>
                                    <input type="text" class="form-control" id="birth" name="birth" readonly />
                                </div>
                                <div class="mb-3">
                                    <label for="occupation" class="form-label">Pekerjaan</label>
                                    <input type="text" class="form-control" id="occupation" name="occupation" readonly />
                                </div>
                                <div class="mb-3">
                                    <label for="nationality" class="form-label">Kebangsaan</label>
                                    <input type="text" class="form-control" id="nationality" name="nationality" readonly />
                                </div>
                                <div class="mb-3">
                                    <label for="passport" class="form-label">Nomor Paspor</label>
                                    <input type="text" class="form-control" id="passport" name="passport" readonly />
                                </div>
                                <div class="mb-3">
                                    <label for="address" class="form-label">Alamat di Indonesia</label>
                                    <textarea type="text" class="form-control" id="address" name="address" readonly></textarea>
                                </div>
                            </div>
                            <!-- end col md 3 -->
                            <div class="col-md-6">
                                <div class="card">
                                    <div class="card-body">
                                        <table>
                                            <tr>
                                                <td>1.</td><td>uang dan/atau instrumen pembayaran lainnya dalam bentuk cek, cek perjalanan, surat sanggup bayar, atau bilyet giro, dalam rupiah atau dalam mata uang asing senilai Rp100.000.000,00 (seratus juta rupiah) atau lebih, atau</td>
                                            </tr>
                                            <tr>
                                                <td>2.</td><td>uang kertas asing paling sedikit setara dengan Rp1.000.000.000,00 (satu milyar rupiah).</td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                                <!-- end card -->
                                <div class="card mt-3">
                                    <div class="card-body">
                                        <table name="detail_goods" class="table table-striped table-sm">
                                            <thead>
                                                <tr>
                                                    <th scope="col">#</th>
                                                    <th scope="col">Uraian Barang</th>
                                                    <th scope="col">Jumlah</th>
                                                    <th scope="col">Nilai</th>
                                                </tr>
                                            </thead>
                                            <tbody></tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <!-- end div col md 6 -->
                            <div class="col-md-3">
                                <h3>Pesawat</h3>
                                <div class="card bg-danger text-white text-center">
                                    <span class="pt-3" view="flight"></span>
                                    <span class="pb-3" view="arrival"></span>
                                </div>

                                <h3>Keterangan</h3>
                                <div class="card bg-danger text-white text-center">
                                    <span class="pt-5 pb-5">DECLARE</span>
                                </div>

                                <h3>Intercept</h3>
                                <div class="card bg-danger text-white text-center">
                                    <span class="pt-5 pb-5"><i class="fa fa-bullseye"></i> Ubah Merah</span>
                                </div>
                            </div>
                            <!-- end div col md 3 -->
                        </div>
                        <!-- end row -->
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-light-primary font-weight-bold" data-dismiss="modal">Tutup</button>
                    </div>
                </div>
                <!-- end modal content -->
            </div>
            <!-- end modal dialog -->
        </div>
        <!-- end modal detail -->
        <!-- end modal layout -->

        <?php $this->load->view('aside/user');?>    
        <?php $this->load->view('aside/script');?>
        <script src="<?=base_url('assets/js/app.ecd.js'); ?>"></script>
    </body>
</html>

(function($) {
var Valas = {
    params: {
        page: 1,
        dateFrom: '',
        dateUntil: '',
        docNumber: '',
        personalDetail: {},
        step2: {},
        // step3: {},
        cashNumber: 1,
        iplNumber: 1,
        confirmSave: 0,
        // itemDetailNumber: 1,
        instrumentNumber: 1
    },
    enabled: function(formName, value) {
        if (value) $('form[name="'+formName+'"]').find('[name^="search"], button').removeAttr('disabled');
        else $('form[name="'+formName+'"]').find('[name^="search"], button').attr('disabled', 'disabled');
    },
    myEncrypt: function(data) {
        var salt = 100*99*98*1*2*3;
	    return salt * data;
    },
    printPage: function() {
        var row = $(this).closest('tr');
        var data = row.attr('id');
        var msg = myEncrypt(data);
        var base_url = window.location.origin + '/valas/print_doc/' + msg;
        var win = window.open(base_url, '_blank');
        if (win) {
            //Browser has allowed it to be opened
            win.focus();
        } else {
            //Browser has blocked it
            alert('Please allow popups for this website');
        }
    },
    deleteData: function() {
        var row = $(this).closest('tr'),
        data = row.attr('id'),
        docNumber = row.find('[view="docNumber"]').html(),
        modalName = $('#deleteModal');

        modalName.find('input[name="valasID"]').val(data);
        modalName.find('span[view="deleteModalDocNumber"]').html(docNumber);
        modalName.modal('show');
    },
    deleteDataServer: function() {
        var id = $('#deleteModal').find('input[name="valasID"]').val();
        var params = { params: id };
        $.ajax({
            url: '/valas/delete',
            type: 'post',
            dataType: 'json',
            data: JSON.stringify(params)
        }).done(function(result) {
            if (result) {
                $('#deleteModal').modal('hide');
                Valas.doSearch();
            }
        }).fail(function() {
            alert('terjadi kesalahan, coba lagi nanti..');
        }).always(function() {
            Valas.enabled('searchValasForm', true);
        });
    },
    renderData: function(data) {
        var result = $('[name="searchResult"]');
        var template = result.find('[template="searchResultRow"]');
        var rows = result.find('tbody').empty();
        var nav = result.find('[name="searchNav"]');
        
        $.each(data.rows, function(index, value) {
            var row = template.clone().removeClass('d-none').removeAttr('template');
            row.attr('id', value.valas);
            row.find('[view="number"]').html(index + 1);
            row.find('[view="docNumber"]').html(value.docNumber);
            row.find('[view="arrivalDate"]').html(value.arrivalDate);
            row.find('[view="name"]').html(value.name);
            row.find('[view="passport"]').html(value.passport);
            // row.find('[view="location"]').html(value.location);
            row.find('[view="flightNumber"]').html(value.flightNumber);
            // row.find('[view="nominal"]').html(value.nominal);
            row.find('[view="country"]').html(value.country);

            // set status
            var status = '';
            if (value.status == '1') {
                status = '<button class="btn btn-sm btn-info">Created</button>';
            } else if (value.status == '2') {
                status = '<button class="btn btn-sm btn-danger">Open</button>';
            } else {
                status = '<button class="btn btn-sm btn-success">Closed</button>';
            }

            row.find('[view="status"]').html(status);
            row.find('[view="actionDetail"]').on('click', Valas.printPage);
            row.find('[view="actionDelete"]').on('click', Valas.deleteData);
            row.appendTo(rows);
        });
        
        if (data.nav.page == 1) nav.find('[name="prev"]').attr('disabled', 'disabled');
        else nav.find('[name="prev"]').removeAttr('disabled');
        nav.find('[name="page"]').html(data.nav.page);
        if (data.nav.last) nav.find('[name="next"]').attr('disabled', 'disabled');
        else nav.find('[name="next"]').removeAttr('disabled');
        
        result.removeClass('d-none');
    },
    doSearch: function() {
        var data = {
            page: Valas.params.page,
            dateFrom: Valas.params.dateFrom,
            dateUntil: Valas.params.dateUntil,
            docNumber: Valas.params.docNumber
        };

        $.ajax({
            url: '/valas/search',
            type: 'post',
            dataType: 'json',
            data: JSON.stringify(data)
        }).done(function(result) {
            if (result) {
                // Academics.search.result(result.searchResult);
                Valas.renderData(result.searchResult);
            }
        }).fail(function() {
            alert('terjadi kesalahan, coba lagi nanti..');
        }).always(function() {
            Valas.enabled('searchValasForm', true);
        });
    },
    removeItems: function() {
        var row = $(this).closest('tr');
        row.remove();
    },
    clearContent: function() {
        // find all input type and clear
        $('form[name="newValasForm"]').find('input, select').val('');
        // find ajax tbody and clear it
        $('table[name="cashTable"]').find('tbody').empty();
        $('table[name="instrumentTable"]').find('tbody').empty();
    },
    createNew: function() {
        Valas.enabled('searchValasForm', false);

        var params = {
            step1: Valas.params.personalDetail, step2: Valas.params.step2
        };
        // console.log(params);

        $.ajax({
            url: '/valas/create_new',
            type: 'post',
            dataType: 'json',
            data: JSON.stringify(params)
        }).done(function(result) {
            if (result) {
                // action after save
                alert('Data berhasil disimpan..');
                $('#newValasModalStep2').modal('hide');
                Valas.params.confirmSave = 0;
                Valas.doSearch();
                // clear all content
                Valas.clearContent();
            }
        }).fail(function() {
            alert('terjadi kesalahan, coba lagi nanti..');
        }).always(function() {
            Valas.enabled('searchValasForm', true);
        });
    },
    init: function() {
        // new function of ipl
        $('#btnAddInstrument').on('click', function() {
            $('#instrumentModal').modal('show');
        });
        $('[name="instrumentForm"]').on('submit', function() {
            var instrumentValas = $(this).find('[name="instrumentValas"]').val();
            var instrumentNominal = $(this).find('[name="instrumentNominal"]').val();
            var instrumentType = $(this).find('[name="instrumentType"]').val();
            var instrunetTypeText = $('select[name=instrumentType] option:selected').text();
            var instrumentNumber = $(this).find('[name="instrumentNumber"]').val();
            var instrumentDate = $(this).find('[name="instrumentDate"]').val();
            var instrumentBank = $(this).find('[name="instrumentBank"]').val();

            var result = $('table[name="instrumentTable"]');
            var template = result.find('[template="instrumentBody"]');
            var rows = result.find('tbody');

            var row = template.clone().removeClass('d-none').removeAttr('template');
            row.find('[view="instrumentNumber"]').html(Valas.params.instrumentNumber);
            row.find('[view="instrumentValas"]').html(instrumentValas);
            row.find('[view="instrumentDenom"]').html(instrumentNominal);
            row.find('[view="instrumentType"]').attr('instrument-value', instrumentType);
            row.find('[view="instrumentType"]').html(instrunetTypeText);
            row.find('[view="instrumentNumberContent"]').html(instrumentNumber);
            row.find('[view="instrumentDate"]').html(instrumentDate);
            row.find('[view="instrumentBank"]').html(instrumentBank);
            
            // remove items
            row.find('[view="instrumentAction"]').on('click', Valas.removeItems);
            row.appendTo(rows);
            Valas.params.itemDetailNumber = Valas.params.instrumentNumber + 1;
            $('#instrumentModal').modal('hide');
            return false;
        });

        // end function
        Valas.doSearch();
        
        $('#dateFrom, #dateUntil, #birth, #otherbirth, #arrivalDate, #instrumentDate').datepicker({
            todayHighlight: true,
            orientation: "bottom left",
            format: 'yyyy-mm-dd'
        });
        // checked of radio button
        $('input[name=reason]').change(function(){
            var value = $('input[name=reason]:checked' ).val();
            
            if (value == "1") {
                $('div[name="othersTemplate"]').addClass('d-none');
                $('div[name="companyTemplate"]').addClass('d-none');
            } else if (value == "2") {
                $('div[name="othersTemplate"]').removeClass('d-none');
                $('div[name="companyTemplate"]').addClass('d-none');
            } else {
                $('div[name="othersTemplate"]').addClass('d-none');
                $('div[name="companyTemplate"]').removeClass('d-none');
            }
        });

        $('#add_valas').on('click', function() {
            // modal show
            // $("input[name=reason][value='1']").attr('checked', 'checked');
            // $('input[name=reason]:checked' ).val('1');
            $('div[name="othersTemplate"]').addClass('d-none');
            $('div[name="companyTemplate"]').addClass('d-none');
            $('#newValasModal').modal('show');
        });

        $('form[name="searchValasForm"]').on('submit', function() {
            Valas.enabled($(this).attr('name'), false);

            var dateFrom = $(this).find('[name="dateFrom"]').val();
            var dateUntil = $(this).find('[name="dateUntil"]').val();
            var docNumber = $(this).find('[name="docNumber"]').val();

            Valas.params.dateFrom = dateFrom;
            Valas.params.dateUntil = dateUntil;
            Valas.params.docNumber = docNumber;

            Valas.doSearch();

            return false;
        });

        // form new valas page1
        $('form[name="newValasForm"]').on('submit', function() {
            var fullName = $(this).find('[name="name"]').val();
            var nationality = $(this).find('[name="nationality"]').val();
            var identity = $(this).find('[name="identity"]').val();
            var birth = $(this).find('[name="birth"]').val();
            var address = $(this).find('[name="address"]').val();
            var occupation = $(this).find('[name="occupation"]').val();
            var reason = $(this).find('input[name=reason]:checked' ).val();
            var country = $(this).find('[name="country"]').val();
            
            // travel data
            var flightNumber = $(this).find('[name="flightNumber"]').val();
            var place = $(this).find('[name="place"]').val();
            var destination = $(this).find('[name="destination"]').val();
            var arrivalDate = $(this).find('[name="arrivalDate"]').val();
            var indonesianaddress = $(this).find('[name="indonesianaddress"]').val();
            var purpose = $(this).find('[name="purpose"]').val();

            // other personal data
            var otherName = $(this).find('[name="othername"]').val();
            var otherNationality = $(this).find('[name="othernationality"]').val();
            var otherIdentity = $(this).find('[name="otheridentity"]').val();
            var otherBirth = $(this).find('[name="otherbirth"]').val();
            var otherAddress = $(this).find('[name="otheraddress"]').val();
            var otherOccupation = $(this).find('[name="otheroccupation"]').val();

            // company
            var corporatename = $(this).find('[name="corporatename"]').val();
            var corporateaddress = $(this).find('[name="corporateaddress"]').val();
            var corporatetype = $(this).find('input[name=corporatetype]:checked' ).val();

            var params = {
                personal: {
                    name: fullName, nationality: nationality, identity: identity, birth: birth, address: address, occupation: occupation,
                    reason: reason, country: country
                },
                travel: {
                    flightNumber: flightNumber, place: place, destination: destination, indonesianaddress: indonesianaddress, 
                    purpose: purpose, arrivalDate: arrivalDate
                },
                others: {
                    otherName: otherName, otherNationality: otherNationality, otherIdentity: otherIdentity, otherBirth: otherBirth, otherAddress: otherAddress, otherOccupation: otherOccupation
                },
                corporate: {
                    corporatename: corporatename, corporateaddress: corporateaddress, corporatetype: corporatetype
                }
            };
            // console.log(params);
            Valas.params.personalDetail = params;
            // set new modal
            $('#newValasModal').modal('hide');
            $('#newValasModalStep2').modal('show');
            return false;
        });

        // step 2
        $('form[name="newValasFormStep2"]').on('submit', function() {
            var theTable = $('table[name="cashTable"]');
            var instrumentTable = $('table[name="instrumentTable"]');
            var rows = theTable.find('tr');
            var instrumentRows = instrumentTable.find('tr');

            var params = {
                cash: [],
                ipl: [],
                reason: '',
                type: '1',
                count: '',
                suspicious: '',
                result: ''
            };

            var cashReason = $(this).find('[name="cashReason"]').val();
            // new input
            var suspicious = $(this).find('input[name=is_suspicious]:checked' ).val(),
                result = $(this).find('input[name=is_result]:checked' ).val(),
                count = $(this).find('input[name=is_result]:checked' ).val();
                
            params.reason = cashReason;
            params.suspicious = suspicious;
            params.result = result;
            params.count = count;

            // cash
            rows.each(function (i, el) {
                var $tds = $(this).find('td'),
                    cashCurrency = $tds.eq(1).text(),
                    cashAmount = $tds.eq(2).text();

                if (cashCurrency != '' || cashAmount != '') {
                    var pushCash = {
                        currency: cashCurrency, amount: cashAmount
                    }

                    params.cash.push(pushCash);
                }   
            });

            // instrument new
            instrumentRows.each(function (i, el) {
                var $tds = $(this).find('td'),
                    inValas = $tds.eq(1).text(),
                    inNominal = $tds.eq(2).text(),
                    inType = $tds.eq(3).attr('instrument-value'),
                    inNUmber = $tds.eq(4).text(),
                    inDate = $tds.eq(5).text(),
                    inBank = $tds.eq(6).text();

                if (inValas != '' || inNominal != '' || inType != '') {
                    var pushInstrument = {
                        valas: inValas, nominal: inNominal, type: inType, number: inNUmber, date: inDate, bank: inBank
                    }

                    params.ipl.push(pushInstrument);
                }      
            });
            // console.log(params);
            
            Valas.params.step2 = params;
            // confirm first then create
            if (Valas.params.confirmSave == 0) {
                $('#confirmModal').modal('show');  
            } else {
                Valas.createNew();
            }
            
            return false;
        }); 

        $('button[name="confirmYes"]').on('click', function() {
            // show previous page
            $('#confirmModal').modal('hide');
            $('#newValasModalStep2').modal('hide');
            $('#newValasModal').modal('show');
            
            Valas.params.confirmSave = 1;
        });

        // pagination
        //nav function
        $('[name="next"]').on('click', function(){
            Valas.params.page = Valas.params.page + 1;
            Valas.doSearch();
        });
        $('[name="prev"]').on('click', function(){
            Valas.params.page = Valas.params.page - 1;
            Valas.doSearch();
        });
        
        // cash page2
        $('#btnAddCash, #btnAddIPL').on('click', function() {
            var btnParam = $(this).attr('view');
            var string = 'cash';
            if (btnParam == 'ipl') {
                string = 'ipl';
            }
            var cashCurrency = $('input[name="'+string+'currency"]').val();
            var cashAmount = $('input[name="'+string+'amount"]').val();

            var result = $('table[name="'+string+'Table"]');
            var template = result.find('[template="'+string+'Body"]');
            var rows = result.find('tbody');

            var row = template.clone().removeClass('d-none').removeAttr('template');
            row.find('[view="'+string+'Currency"]').html(cashCurrency);
            row.find('[view="'+string+'Amount"]').html(cashAmount);

            // after added
            if (btnParam == 'ipl') {
                row.find('[view="'+string+'Number"]').html(Valas.params.iplNumber);
                Valas.params.iplNumber = Valas.params.iplNumber + 1;
            } else {
                row.find('[view="'+string+'Number"]').html(Valas.params.cashNumber);
                Valas.params.cashNumber = Valas.params.cashNumber + 1;
            }
            $('input[name="'+string+'currency"]').val('');
            $('input[name="'+string+'amount"]').val('');

            // remove items
            row.find('[view="'+string+'Action"]').on('click', Valas.removeItems);

            row.appendTo(rows);
        });

        // back function
        $('button[name="btnBack"]').on('click', function() {
            $('#newValasModalStep2').modal('hide');
            $('#newValasModal').modal('show');
        });
        
        $('button[name="confirmDelete"]').on('click', function() {
            Valas.deleteDataServer();
        });
    }
};

Valas.init();

})(jQuery);
(function($) {
    var Ecd = {
        params: {
            page: 1,
            dateFrom: '',
            dateUntil: '',
            flightNumber: '',
            limit: 20
        },
        getDetail: function() {
            var row = $(this).closest('tr'),
            data = row.attr('id');

            var params = {
                headerID: data
            };

            $.ajax({
                url: '/ecd/get_detail',
                type: 'post',
                dataType: 'json',
                data: JSON.stringify(params)
            }).done(function(result) {
                Ecd.renderDetail(result.data);
            }).fail(function() {
                alert('terjadi kesalahan, coba lagi nanti..');
            });
        },
        renderDetail: function(data) {
            $('#fullName').val(data.name);
            $('#birth').val(data.birth);
            $('#occupation').val(data.occupation);
            $('#nationality').val(data.nationality);
            $('#passport').val(data.passport);
            $('#address').val(data.address);
            $('#arrival').val(data.arrival);
            $('#baggage_in').val(data.baggage_in + ' pck');
            $('#baggage_ex').val(data.baggage_ex + ' pck');
            $('#family_num').val(data.family.length);
            $('span[view="flight"]').html(data.flight);
            $('span[view="arrival"]').html(data.arrival);
            // table of goods
            var theTable = $('table[name="detail_goods"]');
            var theBody = theTable.find('tbody').empty();
            var number = 1;
            $.each(data.goods, function(index, value) {
                var row = '<tr>\
                    <th scope="row">' + number + '</th>\
                    <td>'+value.description+'</td>\
                    <td>'+value.quantity+'</td>\
                    <td>'+value.value+'</td>\
                </tr>';
                theBody.append(row);
                number++;
            });
            $('#detailModal').modal('show');

            // family data
            var familyTable = $('table[name="familyTable"]');
            var familyBody = familyTable.find('tbody').empty();
            var number = 1;
            $.each(data.family, function(index, value) {
                var row = '<tr>\
                    <th scope="row">' + number + '</th>\
                    <td>'+value.full_name+'</td>\
                    <td>'+value.passport_number+'</td>\
                </tr>';
                familyBody.append(row);
                number++;
            });

            $('button[name="btnPersonalDetail"]').on('click', function(){
                $('#personalDetailModal').modal('show');
            });
        },
        renderSearch: function(data) {
            var result = $('[name="searchResult"]');
            var template = result.find('[template="searchResultRow"]');
            var rows = result.find('tbody').empty();
            var nav = result.find('[name="searchNav"]');
            var theNumber = 1;
            if (Ecd.params.page > 1) {
                theNumber =  (Ecd.params.limit * Ecd.params.page) + 1;
            }
            $.each(data.rows, function(index, value) {
                var row = template.clone().removeClass('d-none').removeAttr('template');
                row.attr('id', value.ecd);
                row.find('[view="number"]').html(theNumber);
                row.find('[view="name"]').html(value.name);
                row.find('[view="birthDate"]').html(value.birth);
                row.find('[view="passport"]').html(value.passport);
                row.find('[view="flightNumber"]').html(value.flight);
                row.find('[view="arrival"]').html(value.arrival_date);
                
                // set status
                var status = 'Tidak';
                if (value.scan == '1') {
                    status = 'Ya';
                }
                row.find('[view="status"]').html(status);

                // set zone
                if (value.zone == '0') {
                    row.find('[view="zone"]').html('Hijau');
                    row.find('[view="zone"]').addClass('bg-success text-white text-center');
                } else {
                    row.find('[view="zone"]').html('Merah');
                    row.find('[view="zone"]').addClass('bg-danger text-white text-center');
                }
                row.appendTo(rows);
                // row.on('click', Ecd.getDetail);
                theNumber++;
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
                page: Ecd.params.page,
                dateFrom: Ecd.params.dateFrom,
                dateUntil: Ecd.params.dateUntil,
                flightNumber: Ecd.params.flightNumber
            };
    
            $.ajax({
                url: '/ecd/search',
                type: 'post',
                dataType: 'json',
                data: JSON.stringify(data)
            }).done(function(result) {
                if (result) {
                    Ecd.renderSearch(result.searchResult);
                }
            }).fail(function() {
                alert('terjadi kesalahan, coba lagi nanti..');
            });
        },
        init: function() {
            $('.bc-date').datepicker({
                todayHighlight: true,
                orientation: "bottom left",
                format: 'yyyy-mm-dd'
            });

            $('form[name="searchForm"]').on('submit', function() {
                Ecd.params.dateFrom =  $(this).find('[name="dateFrom"]').val();
                Ecd.params.dateUntil =  $(this).find('[name="dateUntil"]').val();
                Ecd.params.flightNumber =  $(this).find('[name="flightNumber"]').val();

                Ecd.doSearch();
                return false;
            });

            Ecd.doSearch();
        }
    };

    Ecd.init();
})(jQuery);
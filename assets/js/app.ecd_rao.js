(function($) {
    var Rao = {
        changeZone: function(personalID){
            var params = {
                personal: personalID
            };
            $.ajax({
                url: '/rao/change_zone',
                type: 'post',
                dataType: 'json',
                data: JSON.stringify(params)
            }).done(function(result) {
                $('[view="detail-change-zone"]').removeClass('bg-danger');
                $('[view="detail-change-zone"]').addClass('bg-secondary');
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
            $('span[view="baggage_in"]').html(data.baggage_in);
            $('span[view="baggage_ex"]').html(data.baggage_ex);
            $('#family_num').val(data.family.length);
            $('span[view="flight"]').html(data.flight);
            $('span[view="arrival"]').html(data.arrival);
            // table of goods
            var theTable = $('table[name="detail_goods"]');
            var theBody = theTable.find('tbody').empty();
            var number = 1;
            $.each(data.goods, function(index, value) {
                var row = '<tr>\
                    <th class="text-center" scope="row">' + number + '</th>\
                    <td class="text-center">'+value.description+'</td>\
                    <td class="text-center">'+value.quantity+'</td>\
                    <td class="text-center">'+value.value+'</td>\
                </tr>';
                theBody.append(row);
                number++;
            });

            // set zone
            if (data.zone == '1') {
                $('[view="detail-zone"]').removeClass('bg-success');
                $('[view="detail-zone"]').addClass('bg-danger');
                $('[view="detail-zone-text"]').html('MERAH');

                // intersect
                $('[view="detail-change-zone"]').removeClass('bg-danger');
                $('[view="detail-change-zone"]').addClass('bg-secondary');
            } else {
                $('[view="detail-change-zone"]').on('click', function(){
                    Rao.changeZone(data.personalID);
                });
            }

            $('#detailModal').modal('show');

            // family data
            var familyTable = $('table[name="familyTable"]');
            var familyBody = familyTable.find('tbody').empty();
            var number = 1;
            $.each(data.family, function(index, value) {
                var row = '<tr>\
                    <th class="text-center" scope="row">' + number + '</th>\
                    <td class="text-center">'+value.full_name+'</td>\
                    <td class="text-center">'+value.date_of_birth+'</td>\
                    <td class="text-center">'+value.passport_number+'</td>\
                </tr>';
                familyBody.append(row);
                number++;
            });
            /*
            $('button[name="btnPersonalDetail"]').on('click', function(){
                $('#personalDetailModal').modal('show');
            });*/
        },
        renderSearch: function(data) {
            var result = $('[name="searchResult"]');
            var template = result.find('[template="searchResultRow"]');
            var rows = result.find('tbody').empty();
            var nav = result.find('[name="searchNav"]');
            
            $.each(data.rows, function(index, value) {
                var row = template.clone().removeClass('d-none').removeAttr('template');
                row.attr('id', value.ecd);
                row.find('[view="name"]').html(value.name);
                row.find('[view="birthDate"]').html(value.birth);
                row.find('[view="passport"]').html(value.passport);
                row.find('[view="flightNumber"]').html(value.flight);
                
                // set status
                var status = 'Tidak';
                if (value.scan == '1') {
                    status = 'Ya';
                }
                row.find('[view="status"]').html(status);

                // set zone
                if (value.zone == '0') {
                    row.find('[view="zone"]').addClass('bg-success');
                } else {
                    row.find('[view="zone"]').addClass('bg-danger');
                }
                row.appendTo(rows);
                row.on('click', Ecd.getDetail);
            });
            
            if (data.nav.page == 1) nav.find('[name="prev"]').attr('disabled', 'disabled');
            else nav.find('[name="prev"]').removeAttr('disabled');
            nav.find('[name="page"]').html(data.nav.page);
            if (data.nav.last) nav.find('[name="next"]').attr('disabled', 'disabled');
            else nav.find('[name="next"]').removeAttr('disabled');
            
            result.removeClass('d-none');
        },
        init: function() {
            $('#qrcode').focus();
            $('#qrcode').focusout(function(){
                $('#qrcode').focus();
            });
            
            $('#qrcode').on('change textInput input', function() {
                var data = $(this).val();

                var params = {
                    qrcode: data
                };

                $.ajax({
                    url: '/rao/get_detail',
                    type: 'post',
                    dataType: 'json',
                    data: JSON.stringify(params)
                }).done(function(result) {
                    // clear and set focus again
                    Rao.renderDetail(result.data);
                }).fail(function() {
                    alert('terjadi kesalahan, coba lagi nanti..');
                }).always(function(){
                    $('#qrcode').val('').focus();
                });
            });

            $('#detailModal').on('hide.bs.modal', function (e) {
                $('#qrcode').focus();
            });
        }
    };

    Rao.init();
})(jQuery);
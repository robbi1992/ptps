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

                // change zone layout
                $('[view="detail-zone"]').removeClass('bg-success');
                $('[view="detail-zone"]').addClass('bg-danger');
                $('[view="detail-zone-text"]').html('MERAH');
                // set header
                $('.modal-header').removeClass('bg-success');
                $('.modal-header').addClass('bg-danger');
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
                // set header
                $('.modal-header').removeClass('bg-success');
                $('.modal-header').addClass('bg-danger');

                $('[view="detail-zone"]').removeClass('bg-success');
                $('[view="detail-zone"]').addClass('bg-danger');
                $('[view="detail-zone-text"]').html('MERAH');

                // intersect
                $('[view="detail-change-zone"]').removeClass('bg-danger');
                $('[view="detail-change-zone"]').addClass('bg-secondary');
            } else {
                // set header
                $('.modal-header').removeClass('bg-danger');
                $('.modal-header').addClass('bg-success');  

                $('[view="detail-zone"]').removeClass('bg-danger');
                $('[view="detail-zone"]').addClass('bg-success');
                $('[view="detail-zone-text"]').html('HIJAU');

                $('[view="detail-change-zone"]').addClass('bg-danger');
                $('[view="detail-change-zone"]').removeClass('bg-secondary');
                
                $('[view="detail-change-zone"]').on('click', function(){
                    Rao.changeZone(data.personalID);
                });
            }

            // $('#detailModal').modal('show');

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
        },
        init: function() {
            $('#detailModal').modal('show');

            $('#qrcode').focus();
            $('#qrcode').focusout(function(){
                $('#qrcode').focus();
            });
            
            $('#qrcode').on('change textInput input', function() {
                // $('#detailModal').modal('hide');
                var data = $(this).val();
                if (data.length >= 18) {
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
                }  
            });

            $('#detailModal').on('hide.bs.modal', function (e) {
                $('#qrcode').focus();
            });
        }
    };

    Rao.init();
})(jQuery);
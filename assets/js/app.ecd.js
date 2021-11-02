(function($) {
    var Ecd = {
        params: {
            page: 1,
            date: ''
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
                date: Ecd.params.date,
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
            Ecd.params.date = $('form[name="searchForm"]').find('input[name="date"]').val();
            Ecd.doSearch();
        }
    };

    Ecd.init();
})(jQuery);
$(document).ready(function () {

    $.each($('.removeRenewDomain'), function () {
        $(this).click(function () {
            $(".modal").modal('show');
            var that = $(this);
            $('#confirm').click(function () {
                $(".modal").modal('hide');
                if ($(that).parent().next().attr('value') == 'extra') {
                    $(that).parent().next().children('td:eq(3)').text('free');
                }
                $(that).parent().remove();
            });
        });
    });

});
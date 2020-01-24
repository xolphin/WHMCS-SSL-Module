$(document).ready(function () {
    var extraDomainListDiv = $('.reissueDomainList').css('display', 'none');
    $('#add_reissue_domain').click(function () {
        var domainName = $('#reissue_domain');
        if (domainName.val() == "") {
            domainName.css('border-color', 'red');
        } else {
            if (domainName.val().match(/^(\*\.)/)) {

            }
            domainName.css('border-color', '#ccc');
            var listData = domainName.val().split('\n');
            var listContainer = $('#reissue-domain-list');
            var numberOfListItems = listData.length;
            var listItem = "<li style='margin-top: 5px;'></li>";
            for (var i = 0; i < numberOfListItems; ++i) {
                if (listData[i] != "") {
                    $(listItem).appendTo(listContainer).html(listData[i] +
                            '<button style="margin-left: 5px;" class="btn btn-default btn-xs btn-danger">x</button>' +
                            '<input type="hidden" name="reissueExtraDomain[]" value="' + listData[i] + '">');
                }
            }
            listContainer.on('click', 'button', function (el) {
                $(this).parent().remove();
            });
            extraDomainListDiv.css('display', 'block');
            domainName.val("");
        }
    });

    $.each($('.removeReissueDomain'), function () {
        $(this).click(function () {
            $("#modalClientAria").modal('show');
            var that = $(this);
            $('#confirm').click(function () {
                $('input[name=remove]').val('true');
                $("#modalClientAria").modal('hide');
                $(that).parent().remove();
            });
        });
    });

    var notifications = $('.notifications').css('display', 'none');
    var labelCompany = $('#label_company');
    var labelDomain = $('#label_domain');

    String.prototype.capitalize = function () {
        return this.charAt(0).toUpperCase() + this.slice(1);
    };

    $('textarea[name=csr]').bind('input propertychange', function () {
        if ($(this).val() != "") {
            $.ajax({
                method: "POST",
                url: location.href,
                data: {csr: $(this).val()}
            })
                    .done(function (result) {
                        var decode = JSON.parse(result);
                        if (decode.message) {
                            labelCompany.html("");
                            labelDomain.html("");
                            var text = "";
                            var i = 1;
                            $.each(decode.errors, function (index, value) {
                                text = text.concat(i + ". " + index.capitalize() + " : " + value + "<br>");
                                i++;
                            });
                            $('.error-result').html(decode.message + "<br>" + text);
                            notifications.css('display', 'block');
                        } else {
                            notifications.css('display', 'none');
                            labelCompany.html(decode.company);
                            labelDomain.html(decode.domain);
                            $('textarea[name=csr]').css('border-color', '#ccc');
                        }
                    });
        } else {
            $(this).css('border-color', 'red');
        }
    });
    
    initPopoverInfo();
});
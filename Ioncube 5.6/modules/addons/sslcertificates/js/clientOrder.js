var customfields,
    confOptExtraInput,
    confOptExtraValue,
    confOptWildcardInput,
    confOptWildcardValue,
    contentNoCSR;


$(document).Loading();
$(document).ready(function () {

    function _x(STR_XPATH) {
        var xresult = document.evaluate(STR_XPATH, document, null, XPathResult.ANY_TYPE, null);
        var xnodes = [];
        var xres;

        while (xres = xresult.iterateNext()) {
            xnodes.push(xres);
        }

        return xnodes;
    }
    var notifications = $('#man-notif').css('display', 'none');
    //Function to load approver email addresses once domain has been filled
    $('input[name=domain]').bind('focusout', function () {
        if ($(this).val() != "") {



            //Check wildcard domain
            if (certificateType === "WILDCARD"){
                if (!$('#domain').val().trim().match(/^(\*\.)/)) {

                    $('#wildcardProductNoWildcardDomain').remove();
                    $('#domain').after('<div id="wildcardProductNoWildcardDomain" class="alert alert-danger">' + lang["sslXolphinInformationEntWildcardDomName"] + '</div>');

                }else{

                    $('#wildcardProductNoWildcardDomain').remove();

                }
            }

            //Check none wildcard domain
            if (certificateType !== "WILDCARD"){
                if (!$('#domain').val().trim().match(/^(?=.{1,254}$)((?=[a-z0-9-]{1,63}\.)(xn--+)?[a-z0-9]+(-[a-z0-9]+)*\.)+[a-z]{2,63}$/i)) {

                    $('#normalProductWildcardDomain').remove();
                    $('#domain').after('<div id="normalProductWildcardDomain" class="alert alert-danger">' + lang["sslXolphinInformationEntWildcardDomNameNormalOrder"] + '</div>');

                }else{

                    $('#normalProductWildcardDomain').remove();

                }
            }


        } else {
            $(this).css('border-color', 'red');
        }
    });


    $('#validationType').bind('change', function () {

        if($('#validationType').val() === "EMAIL"){

            var approverEmails = $('.approver-emails').css('display', 'block');

            $.ajax({
                method: "POST",
                url: location.href,
                data: {
                    domain: $('#domain').val().trim(),
                    certType: certificateType,
                    getEmails: true
                }
            })
                .done(function (result) {
                    addEmails(result, $('.accountNoCSR #approverEmail'), notifications, approverEmails);
                });

        }else{
            var approverEmails = $('.approver-emails').css('display', 'none');
        }

    });





    //var certificateType = $('input[name=certificateType]').val();
    var certificateType = $('input[name=certificateType]').val();
    var extraDomainListDiv = $('.extraDomainList').css('display', 'none');
    var extra = $('.extra').css('display', 'none');

    var labelCompany = $('#label_company');
    var labelDomain = $('#label_domain');



    loadTemplate('#contact-info-man-nocsr');

    if (certificateType == "MULTI") {
        $('.extra').css('display', 'block');
        $('.extraDomainList').css('display', 'block');
    }

    $('#submit-form input, #submit-form textarea').keypress(function (event) {
        if (event.keyCode == 13) {
            event.preventDefault();
            if ($(this).attr('id') === 'extra_domain') {
                $('#add_extra_domain').click();
            }
        }
    });





    $('.accountNoCSR #add_extra_domain').off('click').click(function () {
        var domainName = $('.accountNoCSR').find('#extra_domain');
        var primaryDomain = $('.accountNoCSR').find('#label_domain').text();
        if (!isValidDomain(domainName.val())) {
            domainName.css('border-color', 'red');
        } else if (!isValidDomain(domainName.val()) && certificateGroupName != "Comodo") {
            $(".error-message").html(lang['sslXolphinInformationOnlyComodo']);
            $("#modalClientAria").modal('show');
            $("#modalClientAria").on('hidden.bs.modal', function (e) {
                domainName.css('border-color', 'red');
            });
        } else {
            var customHeights = customfields.height();
            // confOptExtraValue = parseInt(confOptExtraInput.val());

            domainName.css('border-color', '#ccc');
            var listData = domainName.val().split('\n');
            var listContainer = $('.accountNoCSR').find('#extra-domain-list');
            var numberOfListItems = listData.length;
            var listItem = '<li data-name="' + domainName.val() + '"></li>';
            var append = true;

            if (primaryDomain === domainName.val()) {
                append = false;
                $('.error-message').html('This domain has been already used in this order.');
                $("#modalClientAria").modal('show');
            }

            $('#extra-domain-list li').each(function (key) {
                if ($(this).attr('data-name') === domainName.val()) {
                    append = false;
                    $('.error-message').html('This domain has been already used in this order.');
                    $("#modalClientAria").modal('show');
                }
            });
            for (var i = 0; i < numberOfListItems; ++i) {
                if (listData[i] != "" && append) {
                    $(listItem).appendTo(listContainer).html(listData[i] +
                        '<button style="margin-left: 5px;" ' +
                        'class="btn btn-default btn-xs btn-danger removeDomain">x</button>'
                    );
                    customfields.height(customHeights + 34);
                    customHeights = customfields.height();
                }
            }

            if (confOptWildcardInput && append) {
                if (domainName.val().match(/^(\*\.)/)) {
                    confOptWildcardValue++;
                    confOptWildcardInput.val(confOptWildcardValue);
                }
            }

            if (!domainName.val().match(/^(\*\.)/) && append) {
                confOptExtraValue++;
                if(confOptExtraValue >= 0)
                    confOptExtraInput.val(confOptExtraValue);
            }

            $('.accountNoCSR #extra-domain-list .removeDomain').off('click').click(function () {
                if (customHeights >= 630) {
                    customfields.height(customHeights - 34);
                    customHeights = customfields.height();
                }

                if (confOptWildcardInput) {
                    if ($(this).parent().text().match(/^(\*\.)/)) {
                        confOptWildcardValue--;
                        confOptWildcardInput.val(confOptWildcardValue);
                    }
                }

                if (!$(this).parent().text().match(/^(\*\.)/))
                {
                    confOptExtraValue--;
                    if(confOptExtraValue >= 0)
                        confOptExtraInput.val(confOptExtraValue);
                }
                $(this).parent().remove();
            });

            extraDomainListDiv.css('display', 'block');
            domainName.val("");
        }
    });

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
                        customfields.height(700 + notifications.height());
                        $('#csrDecodingError').remove();
                        $('#csr').after('<div id="csrDecodingError" class="alert alert-danger">' + decode.message + '</div>');
                    } else {
                        $('#csrDecodingError').remove();
                        labelCompany.html(decode.company);
                        labelDomain.html(decode.cn);

                        $('#contact-info-man #company').val(decode.company);

                        $('textarea[name=csr]').css('border-color', '#ccc');

                        $.ajax({
                            method: "POST",
                            url: location.href,
                            data: {
                                domain: decode.cn,
                                certType: certificateType,
                                getEmails: true
                            }
                        })
                            .done(function (result) {

                            });
                    }
                });
        }
    });




















    var selectPackage = $('.package');
    var ordercustomfields = $('.ordercustomfields');
    var uid = $('input[name=checkPackage]').attr('value');

    var xid = $('input[name=xid]').val();
    var certificateGroupName = $('input[name=cetrificate_group_name]').val();
    var continueOrder = $("button[type=submit]");

    customfields = $('.customfields');



    if(xid == 0) {
        $('select[name="billingcycle"]').find('option[value="annually"]').remove();
    }


    confOptExtraInput = $(_x('//*[@id="submit-form"]/div[2]/div[1]/div[2]/input'));
    confOptExtraInput.attr('readonly', true);

    confOptWildcardValue = 0;
    if (certificateGroupName == 'GeoTrust') {
        confOptExtraInput.val(0);
        confOptExtraValue = -4;
    } else {
        confOptExtraInput.val(0);
        confOptExtraValue = -1;
    }

    if ($(_x('//*[@id="submit-form"]/div[2]')).children().length > 1) {
        confOptWildcardInput = $(_x('//*[@id="submit-form"]/div[2]/div[2]/div[2]/input'));
        confOptWildcardInput.attr('readonly', true);
    }

    String.prototype.capitalize = function () {
        return this.charAt(0).toUpperCase() + this.slice(1);
    };

    customfields.css('border-bottom', '10px solid white');
    customfields.css('border-top', 'none');

    if ($('input[name=checkCart]').val() == "false") {
        ordercustomfields.height(122);
    }


    selectPackage.off('click').click(function () {
        var autoTemplate = $('input[name=auto-template]').val();
        var manuallyTemplate = $('input[name=manually-template]').val();
        var noCSRTemplate = $('input[name=noCsr-template]').val();
        var template = $('input[name=noHosting]').val();

        $('#no, #no-one, .accountOutsideHosting, #contact-info-man, .accountNoCSR, #contact-info-man-nocsr, #auto-notif, #man-notif, .successCheck, #contact-info-auto, .infoMultidomain, #contact-info-ee, .successCheckEE').css('display', 'none');

        $(this).each(function () {
            $('.infoWildcard').css('display', 'none');

                continueOrder.attr('value', 'nocsr');
                $('.accountNoCSR, #contact-info-man-nocsr').css('display', 'block');
                $('#package_type_hidden').val('nocsr');
                $('#auto-notif').css('display', 'none');

                $('#validationType').css('border-color', '#ccc');




                customfields.height(660);





                if (certificateGroupName != "Comodo") {
                    $('#validationType option[value=DNS]').attr('disabled', true);
                    $('#validationType option[value=FILE]').attr('disabled', true);
                }

                initPopoverInfo();



                var labelCompany = $('#label_company');
                var labelDomain = $('#label_domain');






        });

    });

    $("#submit-form").submit(function (event) {
        event.preventDefault();


            var form = this,
                validateOption = $('#validationType'),
                contactFields = {
                    company: $('#company').val().trim(),
                    address: $('#address').val().trim(),
                    city: $('#city').val().trim(),
                    state: $('#state').val().trim(),
                    country: $('#country').val().trim(),
                    domain: $('#domain').val().trim(),
                    zipcode: $('#zipcode').val().trim(),
                    approverFirstName: $('#approverFirstName').val().trim(),
                    approverLastName: $('#approverLastName').val().trim(),
                    approverPhone: $('#approverPhone').val().trim(),
                    csr: $('textarea[name=csr]').val()
                },
                data = {
                    uid: uid,
                    certificateType: certificateType,
                    contactFields: contactFields,
                    approverEmail:  $('#approverEmail').val(),
                    dcvType: validateOption.val().trim(),
                    csr: $('textarea[name=csr]').val(),
                    extraDomains: $('#extra_domain').val()

                },
              notifications = $('.notifications').css('display', 'none');



        if (customfields.children().length === 0) {
            $(".error-message").html('Please select a package.');
            $("#modalClientAria").modal('show');
            return false;
        }


        if (certificateType === "MULTI") {
            data.extraDomains = getExtraDomains();
        }


            if (notifications.height() !== 32) {
                customfields.height(customfields.height() - notifications.height());
            }

            if (data.uid == "") {
                data.uid = 0;
            }

            data['domain'] = $('#domain').val();

        if (validateOption.val() != "") {
            $.ajax({
                method: "POST",
                url: location.href,
                cache: false,
                data: data,
            }).done(function (result) {
                checkCertificateResult(result, notifications, form);
            });
        } else {
            $('#validationType').css('border-color', 'red');
        }
    });
});

/**/
function checkCertificateResult(result, notifications, form) {
    if (result == "true") {

        //$(".error-message").html(lang['sslXolphinInformationOrderCompSSL']);
      //  $("#modalClientAria").modal('show');
     //   notifications.css('display', 'none');
     //   $("#modalClientAria").off('hidden.bs.modal').on('hidden.bs.modal', function (e) {
            // confOptExtraValue = parseInt(confOptExtraInput.val());
            if (confOptExtraValue < 0) {
                confOptExtraInput.val(0);
            }
            form.submit();
       // });
    } else {
        var response = JSON.parse(result);
        var text = "";
        var i = 1;

        if (typeof response.errors != 'undefined') {
            $.each(response.errors, function (index, value) {
                text = text.concat(i + ". " + index.capitalize() + " : " + value + "<br>");
                i++;
            });
        }

        $('.error-result').html(response.message + "<br>" + text);

        customfields.height(customfields.height() + notifications.height());

        notifications.css('display', 'block');

        return false;
    }
}

/* Set contact info in fields */
function setContactInfo(container, contactInfo) {
    $.each(contactInfo.countries, function (key, name) {
        if (typeof name === 'object') {
            name = name.name;
        }

        container.find('#country').append($('<option>').attr('value', key).text(name));
    });

    if (contactInfo.client.length != 0) {
        container.find('#company').val(contactInfo.client.companyname);
        container.find('#country').val(contactInfo.client.country);
        container.find('#address').val(contactInfo.client.address1);
        container.find('#city').val(contactInfo.client.city);
        container.find('#state').val(contactInfo.client.fullstate);
        container.find('#zipcode').val(contactInfo.client.postcode);
        container.find('#approverFirstName').val(contactInfo.client.firstname);
        container.find('#approverLastName').val(contactInfo.client.lastname);
        container.find('#approverPhone').val(contactInfo.client.phonenumber);
    }
}

/* Load contact info and set */
function loadTemplate(containerSelector) {
    $.ajax({
        method: "POST",
        url: location.href,
        data: {getContactDetails: 1}
    })
            .done(function (result) {
                var contactInfo = JSON.parse(result);
                setContactInfo($(containerSelector), contactInfo);
            });
}

/* Fuction return extra domain */
function getExtraDomains() {
    var liValues = [];

    $('#extra-domain-list li').each(function (index, value) {
        var text = $(this).text();
        text = text.substring(0, text.length - 1);
        liValues.push(text);
    });

    return liValues;
}

/* Function add email in select */
function addEmails(result, select, notifications, approverEmails) {
    var resultJSON = JSON.parse(result);
    var emails = resultJSON.emails;

    if (emails.message) {
        $('.error-result').html(emails.message);
        notifications.css('display', 'block');
    } else {
       // notifications.css('display', 'none');

        var option = select.find('option');

        if (option.length !== 0) {
            select.find('option')
                    .remove()
                    .end()
        }
        $.each(emails, function (index, value) {
            select.append($('<option>', {
                value: value,
                text: value
            }));
        });
        approverEmails.css('display', 'block');
    }

    var select = $('#validationType');
    var fileOption = select.find('option[value="FILE"]');

    var select2 = $('.successCheckEE #validationType');
    var fileOption2 = select2.find('option[value="FILE"]');

    if (resultJSON.platform == 'Plesk') {
        fileOption.prop('disabled', true);
        fileOption2.prop('disabled', true);
        // anchor: already selected option bug
        // if option already selected, drop it
        if(fileOption.is(":selected")){
            select.find('option[value=""]').prop('selected',true);
        }
        if(fileOption2.is(":selected")){
            select2.find('option[value=""]').prop('selected',true);
        }
    } else {
        fileOption.prop('disabled', false);
        fileOption2.prop('disabled', false);
    }
}

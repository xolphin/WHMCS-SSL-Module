/* Function init popover info */
function initPopoverInfo() {
    var popoverInfo = $('.info-popover');

    popoverInfo.on('click', function (e) {
        popoverInfo.not(this).popover('hide');
    });
    
    $('.accountOutsideHosting img').attr('src', $('input[name=img]').val());
}

/* Function validate domain */
function isValidDomain(domain)
{
    return (/^([\*a-zA-Z0-9\-\_]{1,60}[\.])?[a-zA-Z0-9][a-zA-Z0-9\-\_]{1,60}(?:\.[a-zA-Z]{2,})+$/.test(domain)) ?
        true: false;
}
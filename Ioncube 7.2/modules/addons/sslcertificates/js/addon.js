$(document).ready(function(){
    $('#sslcertificatesConnection').on('click',function(e){
        e.preventDefault();

        var API_USER = $("[name='fields[sslcertificates][API_USER]']").val();
        var API_PASS = $("[name='fields[sslcertificates][API_PASSWORD]']").val();
        var credentials = {};

        // if password was entered manually
        if(API_PASS == '' || /[^\*]+/i.test(API_PASS)){
            credentials = {API_USER: API_USER, API_PASSWORD: API_PASS}
        }

        $.get('/modules/addons/sslcertificates/actions/test_connection.php',{credentials: credentials},function(data){
            var result_container = $("#connectionTestResult");
            try {
                data = $.parseJSON(data);
                if(data.message === 'Pong!'){
                    result_container.html('<span style="padding:2px 10px;background-color:#5bb75b;color:#fff;font-weight:bold;">SUCCESSFUL!</span>');
                    return;
                }
            } catch (e) {}
            result_container.html('<span style="padding:2px 10px;background-color:#cc0000;color:#fff;"><strong>FAILED:</strong> Login Failed</span>');
        });
    })
});
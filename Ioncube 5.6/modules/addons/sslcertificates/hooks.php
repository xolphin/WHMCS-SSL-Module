<?php

use SSLCertificates\includes\Settings as Settings;

require_once dirname(__FILE__) . '/includes/Settings.php';
require_once dirname(__FILE__) . '/includes/Helper.php';
require_once dirname(__FILE__) . '/Models/SSLCertificatesModel.php';

/**
 * Using this hook we can add our JS,CSS and JSON inside the head of
 * the document.
 *
 * @param type $vars
 * @return type
 */
function sslcertificatesAdminAreaHeadOutput($vars)
{
    require_once dirname(__FILE__) . '/sslcertificates.php';

    $vars['system_url'] = sslcertificatesGetSystemURL();
    $vars['module_name'] = Settings::getInstance()->getModuleName();

    $vars['css'] = array(
        'css/style.css',
    );

    $vars['js'] = array(
        'js/addon.js',
    );

    return SSLCertificates\includes\Helper::smartyReturn(
                    $vars, Settings::getInstance()->getAddonDir() . '/templates/head.tpl'
    );
}

/**
 * Using this hook we can add our JS,CSS and JSON inside the head of Client
 * the document.
 *
 * @param type $vars
 * @return type
 */
function sslcertificatesClientAreaHeadOutput($vars)
{
    require_once dirname(__FILE__) . '/sslcertificates.php';

    $vars['system_url'] = sslcertificatesGetSystemURL();
    $vars['module_name'] = Settings::getInstance()->getModuleName();

    $vars['js'] = array(
        'js/ajaxLoading/jquery.loading.js',
    );
    $vars['css'] = array(
        'css/style.css',
        'css/jquery.loading.css',
    );


    return SSLCertificates\includes\Helper::smartyReturn(
                    $vars, Settings::getInstance()->getAddonDir() . '/templates/head.tpl'
    );
}

/**
 * Implements ClientAreaPageCart
 * 
 * @global array $_LANG
 * @param array $vars
 * @return array
 */
function sslcertificatesClientAreaPageCart($vars)
{

    $SSLCertificatesModel = new \SSLCertificates\Models\SSLCertificatesModel();

    if(key_exists("productinfo", $vars)){

       if($SSLCertificatesModel->isSSLProduct($vars["productinfo"]["pid"])){

           global $_LANG;

           $vars['lang'] = $_LANG;

           require_once dirname(__FILE__) . '/sslcertificates.php';

           $vars['productscount'] = count($vars['products']);
           $vars['js'] = array(
               'js/main.js',
               'js/clientOrder.js',
           );
           $vars['css'] = array(
               'css/style.css',
           );

           $templatesDir = Settings::getInstance()->getTemplatesDir();

           $vars['templateManuallyNoCSR'] = $templatesDir . '/nocsr.tpl';
           $vars['templateEE'] = $templatesDir . '/encryptioneverywhere.tpl';
           $vars['module_name'] = Settings::getInstance()->getModuleName();
           $vars['img'] = $vars['systemurl'] . 'modules/addons/' . $vars['module_name'] . '/img/icon_info.png';
           $vars['system_url'] = sslcertificatesGetSystemURL();
           $vars['successCheck'] = false;
           $vars['ordercustomfields'] = true;
           $vars['cetrificate_group_name'] = substr($vars['productinfo']['groupname'], 17);



           // EE only xid bug fix
           $vars['xid'] = $SSLCertificatesModel->getProductID($vars['productinfo']['pid']);


           /* Check that Certificate selected at Cart exist */
           $checkCart = $SSLCertificatesModel->existCertAtCart($vars['productinfo']['pid']);

           /* Set Up initial params */
           if ($checkCart) {
               $vars['checkCart'] = "true";
               $vars['certificate_type'] = $checkCart->type;

               if (empty($vars['client'])) {
                   $vars['notLogin'] = $notLogged = true;
                   $vars['checkCart'] = "false";
               }
           }

           /* Order Cart Actions */
           $vars = sslcertificatesCheckPOST($vars);

           $SSLProductPresent = "false";
           $SSLProducts = $SSLCertificatesModel->getInstalledProducts();

           foreach($_SESSION["cart"]["products"] as $cartProduct){

               foreach($SSLProducts as $SSLProduct){

                   if($cartProduct["pid"] == $SSLProduct->pid){
                       $SSLProductPresent = "true";
                   }
               }

           }

           if($SSLProductPresent == "false"){
               unset($_SESSION['cart']['products'][count($_SESSION['cart']['products']) - 1]['xolphin']);
           }
           return $vars;

        }
    }


}

add_hook('ClientAdd', 1, function ($vars) {
    $_SESSION['cart']['products'][count($_SESSION['cart']['products']) - 1]['xolphin']['uid'] = $vars['userid'];
});

add_hook('ProductDelete', 1, function ($vars) {
    $SSLCertificatesModel = new \SSLCertificates\Models\SSLCertificatesModel();

    $SSLCertificatesModel->removeProduct(
           array('pid' => $vars['pid'])
    );


});
add_hook('ShoppingCartValidateCheckout', 1, function ($vars) {

    $_SESSION['xolphincart'] = $_SESSION['cart'];

});

add_hook('AfterShoppingCartCheckout', 1, function ($vars) {

    foreach($_SESSION['xolphincart']['products'] as $product){

        if (isset($product['xolphin']['order'])) {

            $SSLCertificatesModel = new \SSLCertificates\Models\SSLCertificatesModel();

            $order = encrypt(
                json_encode($product['xolphin']['order'], JSON_UNESCAPED_SLASHES), $GLOBALS['cc_encryption_hash']
            );

            $csr = encrypt(
                $product['xolphin']['order']['csr'], $GLOBALS['cc_encryption_hash']
            );

            $pvtKey = "";

            if (isset($product['xolphin']['pvtKey'])) {
                $pvtKey = encrypt(
                    $product['xolphin']['pvtKey'], $GLOBALS['cc_encryption_hash']
                );
            }

            if(strlen($product['xolphin']['order']['csr']) >=10){
                $autosetup = "CSR provided by client";
            }else{
                $autosetup = "CSR not provided by client";
            }

            //Find which service ID belongs to this certificate order
            $sid = $SSLCertificatesModel->findCorrectServiceID($product["pid"], $product["domain"], $vars['OrderID'])->id;

            $SSLCertificatesModel->insertProduct(array(
                'orderid' => $vars['OrderID'],
                'invoiceid' => $vars['InvoiceID'],
                'sid' => '["' . $sid . '"]',
                'uid' => $product['xolphin']['uid'],
                'order' => $order,
                'csr' => $csr,
                'pvtKey' => $pvtKey,
                'autosetup' => $autosetup
            ));

            unset($product['xolphin']);

        }

    }


});

add_hook('AdminAreaHeadOutput', 1, 'sslcertificatesAdminAreaHeadOutput');
add_hook('ClientAreaHeadOutput', 1, 'sslcertificatesClientAreaHeadOutput');
add_hook('ClientAreaPageCart', 1, 'sslcertificatesClientAreaPageCart');
add_hook('AdminClientServicesTabFields', 1, 'sslcertificatesAdminClientServicesPage');
add_hook('AdminClientServicesTabFieldsSave', 1, 'sslcertificatesAdminClientServicesPageSave');


function sslcertificatesAdminClientServicesPage($vars)
{

    $SSLCertificatesModel = new \SSLCertificates\Models\SSLCertificatesModel();

    if($SSLCertificatesModel->serviceIsSSLProduct($vars["id"])){
        $orderDetails = $SSLCertificatesModel->getOrder($vars["id"]);

        $orderDetails->order = json_decode(decrypt($orderDetails->order, $GLOBALS['cc_encryption_hash']));
        $orderDetails->csr = decrypt($orderDetails->csr, $GLOBALS['cc_encryption_hash']);
        $orderDetails->pvtKey = decrypt($orderDetails->pvtKey, $GLOBALS['cc_encryption_hash']);

        $SANs = explode(",", $orderDetails->order->subjectAlternativeNames);

        $fields = array();

        foreach($SANs as $key => $SAN){
            $fields['SAN.' . ($key  + 1) ] = $SAN;
        }

        $fields['CSR'] = "<textarea name='orderCSR' id='orderCSR' style='width:600px; height:600px'>" . $orderDetails->csr . "</textarea>";

        $fields['DCV'] = "<select name='DCV' id='DCV'><option";
                    if($orderDetails->order->dcv == "EMAIL") {
                        $fields['DCV'] = $fields['DCV'] . " selected ";
                    }
        $fields['DCV'] = $fields['DCV'] . ">EMAIL</option><option";
            if($orderDetails->order->dcv == "DNS") {
                $fields['DCV'] = $fields['DCV'] . " selected ";
            }
        $fields['DCV'] = $fields['DCV'] . ">DNS</option><option";
            if($orderDetails->order->dcv == "FILE") {
                $fields['DCV'] = $fields['DCV'] . " selected ";
            }
        $fields['DCV'] = $fields['DCV'] . ">FILE</option>";
        $fields['DCV'] = $fields['DCV'] . "</select>";

        $fields['approverEmail'] = "<input name='approverEmail' id='approverEmail' value='" . $orderDetails->order->approverEmail . "'>";
        return $fields;
    }


}

function sslcertificatesAdminClientServicesPageSave($vars)
{

    $SSLCertificatesModel = new \SSLCertificates\Models\SSLCertificatesModel();

    $orderDetails = $SSLCertificatesModel->getOrder($vars["id"]);
    $order = json_decode(decrypt($orderDetails->order, $GLOBALS['cc_encryption_hash']));
    $order->csr = $vars["orderCSR"];
    $order->dcv = $vars["DCV"];
    $order = encrypt(json_encode($order), $GLOBALS['cc_encryption_hash']);
    $csr = encrypt($vars["orderCSR"], $GLOBALS['cc_encryption_hash']);

    $SSLCertificatesModel->updateOrderCSR($vars["id"], $csr, "", $order);

}



/**
 * Function check POST actions
 * 
 * @param array $vars
 * @return array
 */
function sslcertificatesCheckPOST($vars)
{

    global $_LANG;

    if ($_SERVER['REQUEST_METHOD'] == 'POST') {

        $fields = array(
            'uid' => 'userid',
            'domain' => 'domain'
        );

        foreach ($fields as $key => $value) {
            if (isset($_POST[$key]) && $_POST[$key]) {
                $vars[$value] = $_POST[$key];
            }
        }

        $xolphin = new Xolphin\Xolphin($vars);

        $rootDir = Settings::getInstance()->getRootDir();

        require_once $rootDir . '/xolphin/Module.php';
        require_once $rootDir . '/xolphin/Client.php';
        require_once $rootDir . '/xolphin/Xolphin.php';
        require_once $rootDir . '/xolphin/lib/Log.php';

        $SSLCertificatesModel = new \SSLCertificates\Models\SSLCertificatesModel();


        if (isset($_POST['getContactDetails'])) {
            sslcertificatesGetContactDetails($vars);
            exit;
        }

        /* Case then User have Account and Hosting at System */
        /* OR */
        /* Case then User have/haven't Account and no Hosting at System */
        if (!is_null($_POST['dcvType']) || !is_null($_POST['generateCSR'])) {
            $productID = $SSLCertificatesModel->getProductID($vars['productinfo']['pid']);

            $order['dcvType'] = $_POST['dcvType'];
            $order['approverEmail'] = $_POST['approverEmail'];
            $certType = $_POST['certificateType'];

            foreach ($_POST['contactFields'] as $key => $value) {
                $order[$key] = $value;
            }

            switch ($vars['billingcycle']) {
                case 'annually':
                    $order['years'] = 1;
                    break;
                case 'biennially':
                    $order['years'] = 2;
                    break;
                case 'triennially':
                    $order['years'] = 3;
            }


            if ($certType == "MULTI" && !empty($_POST['extraDomains'])) {
                $order = sslcertificatesGetDCV($order, $_POST['extraDomains']);
            }

            $order['product'] = $productID;

            $success = "true";


            $domainName = $_POST['domain'];
            $_SESSION['cart']['products'][count($_SESSION['cart']['products']) - 1]['domain'] = $domainName;
            $vars['domain'] = $_POST['domain'];

            if (!is_null($_POST['uid'])) {
                $_SESSION['cart']['products'][count($_SESSION['cart']['products']) - 1]['xolphin']['uid'] = $_POST['uid'];
            }

            $_SESSION['cart']['products'][count($_SESSION['cart']['products']) - 1]['xolphin']['order'] = $order;

            print_r($success);
            exit;
        }

        /* Get approver Emails for Domain(-s) */
        if ($_POST['getEmails'] && !is_null($_POST['domain'])) {
            print_r(json_encode(array(
                'emails' => $xolphin->approverEmailAddresses($_POST['domain']),
                'platform' => $SSLCertificatesModel->getPlatformName($_POST['domain'])
            )));
            exit();
        }

        if(!isset($vars['products'][0]['domain'])){
            $vars['products'][0]['domain'] = $vars['domain'];
        }

        $_SESSION['cart']['products'][count($_SESSION['cart']['products']) - 1]['xolphin']['csr'] = $_POST["csr"];
        /* Decode CSR */
        if (!is_null($_POST['csr']) && is_null($_POST['dcvType'])) {

            try {
                $decodeCSR = $xolphin->decodeCSR(array("csr" => $_POST['csr']));

                $object = json_decode($decodeCSR);

                $name = sslcertificatesGetNameCN($object->cn);

                $_SESSION['cart']['products'][count($_SESSION['cart']['products']) - 1]['xolphin']['domain'] = $name;
                $_SESSION['cart']['products'][count($_SESSION['cart']['products']) - 1]['xolphin']['domains'][count($_SESSION['cart']['products']) - 1][$vars['productinfo']['pid']] = $name;

                print_r(json_encode($decodeCSR));
            } catch (\Exception $ex) {
                print_r(json_encode(array('message' => $ex->getMessage())));
            }

            exit;
        }
    }


    return $vars;
}


/**
 * Function return contact details
 * 
 * @param array $vars
 */
function sslcertificatesGetContactDetails($vars)
{
    $_countries = Settings::getInstance()->getRootDir() . '/includes/countries.php';

    if (file_exists($_countries)) {
        require $_countries;
    } else {
        $countries = json_decode(file_get_contents(Settings::getInstance()->getRootDir() . '/resources/country/dist.countries.json'), true);
    }

    print_r(json_encode(array(
        'client' => $vars['clientsdetails'],
        'countries' => $countries,
    )));
}

/**
 * Function add to order subjectAlternativeNames and dcv elements
 * 
 * @param array $order
 * @param array $extraDomains
 * @return array
 */
function sslcertificatesGetDCV($order, $extraDomains)
{
    $dcv = array();

    foreach ($extraDomains as $key => $domain) {
        preg_match('/([a-z]+@)/', $order['approverEmail'], $matches);
        preg_match('/[^.]+\.[^.]+$/', $domain, $match);
        if ($match[0]) {
            $domain = $match[0];
        }
        $dcv[] = array(
            'dcvType' => $order['dcvType'],
            'approverEmail' => $matches[0] . $domain
        );
    }

    $order['subjectAlternativeNames'] = implode(',', $extraDomains);
    $order['dcv'] = json_encode($dcv);

    return $order;
}

/**
 * 
 * @param string $cn
 * @return string
 */
function sslcertificatesGetNameCN($cn)
{
    $name = $cn;

    preg_match('/^(\*\.)/', $cn, $match);

    if ($match[0]) {
        $name = substr($cn, 2);
    }

    preg_match('/^(www\.)/', $cn, $match);

    if ($match[0]) {
        $name = substr($cn, 4);
    }

    return $name;
}

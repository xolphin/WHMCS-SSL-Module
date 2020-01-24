{foreach from=$css item=file}
    <link type="text/css" href="{$system_url}modules/addons/{$module_name}/{$file}?{$cache_ver}" rel="stylesheet" />
{/foreach}

{foreach from=$js item=file}
    <script type="text/javascript" src="{$system_url}modules/addons/{$module_name}/{$file}?{$cache_ver}"></script>
{/foreach}

<link rel="stylesheet" type="text/css" href="templates/orderforms/{$carttpl}/style.css"/>

<div id="order-boxes">

    <div class="header-lined">
        <h1>{$LANG.orderconfigure}</h1>
    </div>

    <p>{$LANG.cartproductdesc}</p>

    <form method="post" action="{$smarty.server.PHP_SELF}?a=confproduct&i={$i}" id="submit-form">
        <input type="hidden" name="configure" value="true">
        <input type="hidden" name="certificateType" value="{$certificate_type}">
        <input type="hidden" name="cetrificate_group_name" value="{$cetrificate_group_name}">
        <input type="hidden" name="checkCart" value="{$checkCart}">
        <input type="hidden" name="auto-template" value="{$templateAuto}">
        <input type="hidden" name="manually-template" value="{$templateManually}">
        <input type="hidden" name="noCsr-template" value="{$templateManuallyNoCSR}">
        <input type="hidden" name="noHosting" value="{$noHosting}">
        <input type="hidden" name="img" value="{$img}">
        <input type="hidden" name="xid" value="{$xid}">

        {if $errormessage}
            <div class="alert alert-danger alert-dismissible" role="alert">
                <button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span
                            class="sr-only">Close</span></button>
                <strong>{$LANG.clientareaerrors}</strong>
                <ul>
                    {$errormessage}
                </ul>
            </div>
        {/if}

        <h3>{$LANG.orderproduct}</h3>

        <div class="fields-container">
            <div class="field-row clearfix">
                <div class="col-sm-4">{$LANG.orderproduct}</div>
                <div class="col-sm-8"><strong>{$productinfo.groupname} - {$productinfo.name}</strong></div>
            </div>
            
            <div class="field-row clearfix">
                <div class="col-sm-4">{$LANG.orderdesc}</div>
                <div class="col-sm-8">{$productinfo.description}</div>
            </div>
            
            <div class="field-row clearfix">
                <div class="col-sm-4">{$LANG.orderbillingcycle}</div>
                <div class="col-sm-8">
                    <input type="hidden" name="previousbillingcycle" value="{$billingcycle}"/>
                    {if $pricing.type eq "free"}
                        <input type="hidden" name="billingcycle" value="free"/>
                        {$LANG.orderfree}
                    {elseif $pricing.type eq "onetime"}
                        <input type="hidden" name="billingcycle" value="onetime"/>
                        {$pricing.onetime} {$LANG.orderpaymenttermonetime}
                    {else}
                        <select name="billingcycle" onchange="submit()" class="form-control select-inline">
                            {foreach from=['monthly', 'quarterly', 'semiannually', 'annually', 'biennially', 'triennially'] item=period}
                                {if $pricing[$period]}
                                    <option value="{$period}"{if $billingcycle eq $period} selected="selected"{/if}>{$pricing[$period]}</option>
                                {/if}
                            {/foreach}
                        </select>
                    {/if}
                </div>
            </div>
        </div>

        {if $productinfo.type eq "server"}
            {include file="orderforms/$carttpl/configproduct-blocks/server.tpl"}
        {/if}

        {if $configurableoptions}
            {include file="orderforms/$carttpl/configproduct-blocks/configurableoptions.tpl"}
        {/if}

        {if $addons}
            {include file="orderforms/$carttpl/configproduct-blocks/addons.tpl"}
        {/if}

        {if $customfields}
            {include file="orderforms/$carttpl/configproduct-blocks/customfields.tpl"}
        {/if}

        {if $ordercustomfields}
            {include file="orderforms/$carttpl/configproduct-blocks/ordercustomfields.tpl"}
        {/if}

        <div class="line-padded text-center">
            <button type="submit" class="btn btn-primary btn-lg" id="continueButton">{$LANG.continue} &nbsp;<i
                        class="fa fa-arrow-circle-right"></i></button>
        </div>

    </form>

    <div class="secure-warning">
        <img src="assets/img/padlock.gif" align="absmiddle" border="0" alt="Secure Transaction"/>
        &nbsp;{$LANG.ordersecure} (<strong>{$ipaddress}</strong>) {$LANG.ordersecure2}
    </div>

</div>

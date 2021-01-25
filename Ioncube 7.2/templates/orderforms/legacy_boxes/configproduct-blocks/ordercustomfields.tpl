<input type="hidden" name="checkPackage" value="{$clientsdetails.userid}">

<h3>{$LANG.orderadditionalrequiredinfo}</h3>

<div class="fields-container ordercustomfields">

    <div class="modal fade bs-example-modal-lg" id="modalClientAria" tabindex="-1" role="dialog" aria-labelledby="hostingLargeModalLabel">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="error-message">
                </div>
            </div>
        </div>
    </div>

    {*Custom fields added by Admin from WHMCS Panel*}
    {foreach from=$customfields item=customfield}
        <div class="field-row clearfix">
            <div class="col-sm-4">{$customfield.name}</div>
            <div class="col-sm-8">
                {$customfield.input}{if $customfield.description}<br/>{$customfield.description}{/if}
            </div>
        </div>
    {/foreach}
</div>

<div class="fields-container customfields">

    <!-- ++++++++++++++++++++ MANUALLY ++++++++++++++++++++ -->
    {include file="orderforms/$carttpl/configproduct-blocks/noCsr.tpl"}
    <!-- ++++++++++++++++++++++++++++++++++++++++++++++++++  -->

    <input type="hidden" name="package_type_hidden" id="package_type_hidden" value=""/>

</div>
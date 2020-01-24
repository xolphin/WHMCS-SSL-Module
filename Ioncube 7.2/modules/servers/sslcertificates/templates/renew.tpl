<h2>{$lang['sslXolphinServerRenewCert']}</h2>

{if isset($smarty.session.xolphin.error)}
    <div class="alert alert-danger">
        <p><strong>{$lang['sslXolphinServerErrorOccured']}:</strong> {$smarty.session.xolphin.error}</p>
    </div>
{/if}
{if $result.success}
    <div style="margin:0 0 10px 0;padding:10px 35px;background-color:#dff0d8;color:#555;font-size:16px;text-align:center;">
        {$result.text}
    </div>
{/if}
{if $infoCert && $infoCert.status}
    <hr>
    <div class="row">
        <div class="col-sm-8">
            <strong>{$lang['sslXolphinServerExpDate']}: </strong>{$infoCert.expire}
        </div>
    </div>
    <div class="panel-body">
        <form method="post" action="clientarea.php?action=productdetails&id={$serviceid}&modop=custom&a=renew">
            <input type="hidden" name="id" value="{$serviceid}"/>
            <input type="hidden" name="modop" value="custom"/>
            <input type="hidden" name="a" value="renew"/>
            <input type="hidden" name="certificate" value="renewMulti"/>
            <table class="table table-list dataTable no-footer dtr-inline" role="grid">
                <thead>
                    <tr class="info">
                        <td>{$lang['sslXolphinServerType']}</td>
                        <td>{$lang['sslXolphinServerDomain']}</td>
                        <td></td>
                        <td>{$lang['sslXolphinServerPrice']}</td>
                        <td style="text-align: center;">{$lang['sslXolphinServerAction']}</td>
                    </tr>
                </thead>
                <tr>
                    <td>{$lang['sslXolphinServerMain']}</td>
                    <td>{$info.main.domain}</td>
                    <td></td>
                    <td>{$info.main.price}</td>
                    <td></td>
                </tr>
                {foreach from=$info.sanNamesExtra item=extra}
                    <tr value="extra">
                        <td>{$lang['sslXolphinServerExtSan']}</td>
                        <td>{$extra.domain}</td>
                        <td><input type="hidden" name="renewDomain[]" value="{$extra.domain}"/></td>
                        <td>{$extra.price}</td>
                        <td class="removeRenewDomain" style="text-align: center; color: #f60000;">{$lang['sslXolphinServerRemove']}
                        </td>
                    </tr>
                {foreachelse}
                    <tr class="alert alert-warning">
                        <td>{$lang['sslXolphinServerExtSan']}</td>
                        <td>{$lang['sslXolphinServerNoDisplay']}</td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                {/foreach}
                {foreach from=$info.sanNamesWildcard item=wildcard}
                    <tr value="wildcard">
                        <td>{$lang['sslXolphinServerRenewWilSan']}</td>
                        <td>{$wildcard.domain}</td>
                        <td><input type="hidden" name="renewDomain[]" value="{$wildcard.domain}"/></td>
                        <td>{$wildcard.price}</td>
                        <td class="removeRenewDomain" style="text-align: center; color: #f60000;">{$lang['sslXolphinServerRemove']}
                        </td>
                    </tr>
                {foreachelse}
                    <tr class="alert alert-warning">
                        <td>{$lang['sslXolphinServerRenewWilSan']}</td>
                        <td>{$lang['sslXolphinServerNoDisplay']}</td>
                        <td></td>
                        <td></td>
                        <td></td>
                    </tr>
                {/foreach}
            </table>
            <span class="col-xs-12 renew" style="top: 10px; padding-bottom: 10px;">
                <button type="submit" id="renewCert" class="btn btn-primary center-block {if !$infoCert.renewEnabled} popup{/if}">{$lang['sslXolphinServerRenew']}</button>
            </span>
        </form>
    </div>

    <div class="modal fade bs-example-modal-sm" tabindex="-1" id="renewmodal" role="dialog" aria-labelledby="renewLargeModalLabel">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="renewLargeModalLabel">{$lang['sslXolphinServerRenewManSan']}</h4>
                </div>
                <div class="modal-body">
                    {$lang['sslXolphinServerDelSanName']}
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">{$lang['sslXolphinServerClose']}</button>
                    <button type="button" class="btn btn-primary" id="confirm">{$lang['sslXolphinServerConfirm']}</button>
                </div>
            </div>
        </div>
    </div>
    {foreach from=$js item=file}
        <script type="text/javascript" src="/modules/servers/sslcertificates/{$file}"></script>
    {/foreach}
{else}    
    <div class="alert alert-warning">{$lang['sslXolphinServerCertNoValid']}</div>
{/if}
<hr>
{include file="$dir/templates/back.tpl"}

{literal}
    <style>
        #cert-manage hr {
            margin-bottom: 0;
        }
    </style>
    <script>
        $(function () {
            $('#renewCert').on('click', function (event) {
                if ($(this).hasClass('popup')) {
                    event.preventDefault();
                    alert("You can renew certificate only 60 days before its expire.");
                }
                if ($(this).hasClass('autorenew')) {
                    if (!confirm('Are you sure?')) {
                        event.preventDefault();
                    }
                }
            });
        });
    </script>
{/literal}
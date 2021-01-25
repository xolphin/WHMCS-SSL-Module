<h2>{$lang['sslXolphinServerManageCert']}</h2>

<div id="cert-manage">
    {if $result.success}
        <div style="margin:0 0 10px 0;padding:10px 35px;background-color:#dff0d8;color:#555;font-size:16px;text-align:center;">
            {$result.text}
        </div>
    {/if}
    {if $info.validated}
        <div class="alert alert-info">{$lang['sslXolphinServerManageValid']}</div>
        <h3>{$LANG.orderproduct}:</h3>
        <div class="row">
            <div class="col-sm-8">
                {$groupname} - {$product}
            </div>
            <div class="col-sm-2"></div>
            <div class="col-sm-2"></div>
        </div>
        <div class="row">            
            <div class="col-sm-8">{$info.certificate.domainName}</div>
            <div class="col-sm-2">
                {if !$info.ee}
                    <form method="post" action="clientarea.php?action=productdetails">
                        <input type="hidden" name="id" value="{$serviceid}"/>
                        <input type="hidden" name="modop" value="custom"/>
                        <input type="hidden" name="a" value="manage"/>
                        <input type="hidden" name="certificate" value="download"/>
                        <button type="submit" class="btn btn-info btn-warning btn-block">{$lang['sslXolphinServerDownload']}</button>
                    </form>
                {/if}
            </div>
            <div class="col-sm-2"></div>
        </div>


        {if $type != 'MULTI'}
            <hr>
            <div class="row">
                <div class="col-sm-8">
                    <h3>{$lang['sslXolphinServerExpDate']}:</h3>
                </div>
                <div class="col-sm-4"></div>
            </div>
            <div class="row">
                <div class="col-sm-8">
                    {$info.expire}
                </div>
                <div class="col-sm-2">
                    <form method="post" action="clientarea.php?action=productdetails">
                        <input type="hidden" name="id" value="{$serviceid}"/>
                        <input type="hidden" name="modop" value="custom"/>
                        <input type="hidden" name="a" value="manage"/>
                        <input type="hidden" name="certificate" value="renew"/>
                        <button type="submit" class="btn btn-success btn-block{if !$info.renewEnabled} popup{/if} ">{$lang['sslXolphinServerRenew']}</button>
                    </form>
                </div>
            </div>
        {/if}
        {if !$info.ee}
            <hr>        
            <div class="row">
                <div class="col-sm-8">
                    <h3>{$lang['sslXolphinServerManageAutoRenew']}:</h3>
                </div>
                <div class="col-sm-2"></div>
                <div class="col-sm-2"></div>
            </div>
            <div class="row">
                <div class="col-sm-8">{if $autorenew}{$lang['sslXolphinServerEnabled']}{else}{$lang['sslXolphinServerDisabled']}{/if}</div>
                <div class="col-sm-2">
                    <form method="post" action="clientarea.php?action=productdetails">
                        <input type="hidden" name="id" value="{$serviceid}"/>
                        <input type="hidden" name="modop" value="custom"/>
                        <input type="hidden" name="a" value="manage"/>
                        <input type="hidden" name="certificate" value="autorenew"/>
                        <input type="hidden" name="autorenew" value="{if $autorenew == 0}1{else}0{/if}"/>
                        <button type="submit" class="btn btn-info btn-block autorenew">{if !$autorenew}{$lang['sslXolphinServerEnable']}{else}{$lang['sslXolphinServerDisable']}{/if}</button>
                    </form>
                </div>
                <div class="col-sm-2"></div>
            </div>     
        {/if}
    {else}

            <div class="alert alert-warning">{$lang['sslXolphinServerCertNoValid']}</div>

    {/if}
</div>
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
            $('#cert-manage').find('button').on('click', function (event) {
                if ($(this).hasClass('popup')) {
                    event.preventDefault();
                    alert(lang['sslXolphinCertificatesDaysExp']);
                }
                if ($(this).hasClass('autorenew')) {
                    if (!confirm(lang['sslXolphinCertificatesSure'])) {
                        event.preventDefault();
                    }
                }
            });
        });
    </script>
{/literal}
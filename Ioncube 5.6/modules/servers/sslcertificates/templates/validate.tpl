<h2>{$lang['sslXolphinServerValidateDomValid']}</h2>

{if isset($message.success)}
    <div class="alert alert-success">
        <p>{$message.success}</p>
    </div>
{/if}



<div id="cert-manage">
    {if !$info.validated && $info.validate == 'dcv'}
        {foreach from=$info.certificate.validations.dcv.domains item=row name=row}
            {if $smarty.foreach.row.first}
                <div class="alert alert-info">
                    {if $row.dcvType == 'DNS'}
                        {$lang['sslXolphinServerValidateDcvDns']}
                    {elseif $row.dcvType == 'FILE'}
                        {$lang['sslXolphinServerValidateDcvFile']}
                    {else}
                        {$lang['sslXolphinServerValidateEmailSent']}
                    {/if}
                </div>
                <hr>
                <div class="row">
                    <div class="col-sm-4 bold"><strong>{$lang['sslXolphinServerDomain']}</strong></div>
                    <div class="col-sm-8 bold"><strong>{$lang['sslXolphinServerValidate']}</strong></div>
                </div>
            {/if}

            {if $row.dcvType != 'EMAIL'}
                <div class="row">
                    <hr>
                    <div class="col-sm-4">{$row.domain|replace:'www.':''}</div>
                    <div class="col-sm-8">
                        {if $row.dcvType == 'DNS'}
                            <div class="form-group">
                                <label for="host">{$lang['sslXolphinServerHost']}:</label>
                                <input type="text" class="form-control readonly" id="host" value="{$row.dnsRecord}" readonly="readonly">
                            </div>
                            <div class="form-group">
                                <label for="val">{$lang['sslXolphinServerValue']}:</label>
                                <input type="text" class="form-control readonly" id="val" value="{$row.dnsCnameValue}" readonly="readonly">
                            </div>
                        {elseif $row.dcvType == 'FILE'}
                            <div class="form-group">
                                <label for="host">{$lang['sslXolphinServerValidateFollLink']}:</label>
                                <br>
                                <a href="http://{$row.fileLocation|replace:'www.':''}">http://{$row.fileLocation|replace:'www.':''}</a>
                            </div>
                            <div class="form-group">
                                <label for="val">{$lang['sslXolphinServerValidateFileBelow']}:</label>
                                <textarea class="form-control readonly" id="val" readonly="readonly">{$row.fileContents}</textarea>
                            </div>
                        {/if}
                    </div>
                </div>
            {else}
                <form method="post" action="clientarea.php?action=productdetails&id={$serviceid}&modop=custom&a=validate">
                    <input type="hidden" name="id" value="{$serviceid}"/>
                    <input type="hidden" name="modop" value="custom"/>
                    <input type="hidden" name="a" value="validate"/>
                    <input type="hidden" name="ac" value="resend"/>
                    <input type="hidden" name="domain" value="{$row.domain|replace:'www.':''}"/>
                    <div class="row">
                        <hr>
                        <div class="col-sm-4">{$row.domain|replace:'www.':''}</div>
                        <div class="col-sm-8">
                            {assign var="dcvEmail" value="{if $row.dcvEmail == 'Not Yet Set'}{$dcvEmailName}@{$row.domain|replace:'www.':''}{else}{$row.dcvEmail}{/if}"}
                            <div class="form-group">
                                <label for="readonly-email-validation">{$lang['sslXolphinEmailValidationLabel']}:</label>
                                <input type="text" class="form-control readonly" id="email-validation" name="readonly-email-validation" value="{$dcvEmail}" readonly="readonly">
                            </div>
                            <div class="form-group">
                                <label for="change">{$lang['sslXolphinChangeEmailValidationLabel']}:</label>
                                {{var_dump($dcv2)}}
                                <select class="form-control" id="change" name="email-validation-resend">
                                    {foreach from=$emailNames item=name}
                                        <option value="{$name}"{if $name == $dcvEmail} selected="selected"{/if}>{$name}</option>
                                    {/foreach}
                                </select>
                            </div>
                            <div class="form-group">
                                <button type="submit" class="btn btn-success pull-right">{$lang['sslXolphinResendButton']}</button>
                            </div>
                        </div>
                    </div>
                </form>
            {/if}
        {/foreach}
    {elseif $info.validate == 'other' && $info.certificate.validations|count}
        <table class="table table-list dataTable no-footer dtr-inline" role="grid">
            <thead>
            <tr role="row">
                <th>{$lang['sslXolphinServerValidation']}</th>
                <th>{$lang['sslXolphinServerStatus']}</th>
            </tr>
            </thead>
            <tbody>
            {foreach from=$info.certificate.validations item=validate key=name}
                <tr>
                    <td>{$name|ucfirst} {$lang['sslXolphinServerValidation']}</td>
                    <td class="text-center">
                        {if $validate.statusDetail == -1}
                            <span class="text-warning">{$validate.statusMessage|ucfirst}</span><br>
                            <i>{$lang['sslXolphinEmailWithDetailsInfo']}</i>
                        {else}
                            {$validate.statusMessage|ucfirst}
                        {/if}
                    </td>
                </tr>
            {/foreach}
            </tbody>
        </table>
        <div class="alert alert-warning">{$lang['sslXolphinServerValidateProgress']}</div>
        <div class="row">
            <div class="col-sm-12">{$lang['sslXolphinEnterEmailAdressReceiveLink']}</div>
        </div>
        <form method="post" action="clientarea.php?action=productdetails&id={$serviceid}&modop=custom&a=validate">
            <input type="hidden" name="id" value="{$serviceid}"/>
            <input type="hidden" name="modop" value="custom"/>
            <input type="hidden" name="a" value="validate"/>
            <input type="hidden" name="ac" value="subscriber-agreement"/>
            <div class="row">
                <hr>
                <div class="col-sm-4">{$lang['sslXolphinOnlineFillingLabel']}</div>
                <div class="col-sm-8">
                    <div class="form-group">
                        <label for="email-sa">{$lang['sslXolphinServerEmail']}:</label>
                        <input type="text" id="email-sa" class="form-control" name="email-sa" value="">
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-success pull-right">{$lang['sslXolphinSendButton']}</button>
                    </div>

                </div>
            </div>
        </form>
    {else}
        {if $info}
            <div class="alert alert-success">{$lang['sslXolphinServerValidateSuccess']}</div>
        {/if}
    {/if}
    <hr>
</div>

{literal}
    <style>
        .readonly {
            color: #a11;
        }
        #val {
            max-height: 80px;
            min-height: 80px;
        }
    </style>
    <script>
        $(function () {
            $('.readonly').on('click', function (e) {
                e.preventDefault();
                $(this).select();
            });
        });
    </script>
{/literal}

{include file="$dir/templates/back.tpl"}
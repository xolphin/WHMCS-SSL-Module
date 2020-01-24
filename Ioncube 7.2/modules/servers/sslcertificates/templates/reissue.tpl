<h2>{$lang['sslXolphinServerReissueSert']}</h2>

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

{if $cert && $cert.status}
    <div style="margin:0 0 10px 0;padding:10px 35px;background-color:#ffffd2;color:#555;font-size:16px;text-align:center;">
        {$lang['sslXolphinServerLostSert']}
    </div>
    
    <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
        <div class="panel panel-default">
            <div class="panel-heading success" role="tab" id="headingOrder">
                <h4 class="panel-title">
                    <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOrder"
                       aria-expanded="false" aria-controls="collapseOrder">
                        {$lang['sslXolphinServerReissueSert']}
                    </a>
                </h4>
            </div>
            <div id="collapseOrder" class="panel-collapse collapse" role="tabpanel"
                 aria-labelledby="headingOrder">
                <div class="panel-body">

                    <form method="post" action="clientarea.php?action=productdetails&id={$serviceid}&modop=custom&a=reissue"
                          id="reissueCert">
                        <input type="hidden" name="id" value="{$serviceid}"/>
                        <input type="hidden" name="modop" value="custom"/>
                        <input type="hidden" name="a" value="reissue"/>
                        <input type="hidden" name="certificate" value="reissue"/>
                        <input type="hidden" name="extra" value="false"/>
                        {if $auto}
                            <div class="cert-information col-xs-6">
                                <div class="brdr">
                                    <label for="label_extra_domains" class="control-label h3style"
                                           style="margin-bottom: 0px;">
                                        <font>
                                        <font class=""><h4>{$lang['sslXolphinServerCertInfo']}:</h4></font>
                                        </font>
                                    </label>
                                </div>
                                <div style="margin-top: 10px;">
                                    <div class="input-group box col-lg-6">
                                        <label for="domain">{$lang['sslXolphinServerDomain']}</label>
                                        <input type="text" name="domain" id="domain" class="form-control"
                                               value="{$info.domain}" readonly>
                                    </div>
                                    <div class="approver-emails" style="margin-top: 10px;">
                                        <div class="form-group" style="margin-bottom: 10px;">
                                            <label for="approverEmail">{$lang['sslXolphinServerAppEmail']}</label>
                                            <select name="approverEmail" id="approverEmail" class="form-control" disabled>
                                                <option value="{$order.approverEmail}">{$order.approverEmail}</option>
                                            </select>
                                        </div>
                                    </div>
                                    {if $info.sanNames}
                                        <div class="extra" style="margin-top: 10px;">
                                            <div class="input-group box col-lg-6">
                                                <label for="extra-domain">{$lang['sslXolphinServerExtDomain']}</label>
                                                <ul name="extra-domain" class="form-group">
                                                    {foreach from=$info.sanNames item=domain}
                                                        <li>
                                                            {$domain}
                                                        </li>
                                                    {/foreach}
                                                </ul>
                                            </div>
                                        </div>
                                    {/if}
                                    <div class="form-group" {if $info.sanNames}style="margin-top: 65px;"{/if}>
                                        <label for="validationType" class="h3style" style="margin-bottom: 0px;">
                                            <strong>{$lang['sslXolphinServerValidType']}</strong>
                                        </label>
                                        <select name="validationType" id="validationType" class="form-control" disabled>
                                            {if $order.dcvType == 'EMAIL'}
                                                <option value="EMAIL" selected>{$lang['sslXolphinServerEmail']}</option>
                                            {elseif $order.dcvType == 'DNS'}
                                                <option value="DNS" selected>{$lang['sslXolphinServerCName']}</option>
                                            {else}
                                                <option value="FILE" selected>{$lang['sslXolphinServerUplFile']}</option>
                                            {/if}
                                        </select>
                                    </div>                                

                                        <div class="form-group">
                                            <label for="csr" class="h3style" style="margin-top: 5px;"><strong>{$lang['sslXolphinServerCSR']}</strong></label>
                                            <textarea class="form-control" id="csr" name="csr" cols="50" rows="10"></textarea>
                                        </div>

                                </div>
                            </div>
                        {else}
                            <div class="accountOutsideHosting col-xs-6">
                                <label for="crs" class="h3style" style="margin-top: 5px;"><strong>{$lang['sslXolphinServerCSR']}</strong>
                                    <a rel='popover'
                                       class="info-popover img-circle"
                                       data-placement='right'
                                       style="width: 650px;"
                                       data-original-title="&lt;b&gt;CSR Information&lt;/b&gt;"
                                       data-content='A <a href="https://en.wikipedia.org/wiki/Certificate_signing_request"
                                       target="blank"> Certificate Signing Request </a> is a code that you create on the
                                       Web server where the certificate must be installed on. This is a piece of encrypted text
                                       containing information about your server and to request certificate. CSR paste it into the
                                       field below. We recommend that you generate a CSR of at least 2048 bits. This looks
                                       something like this:
                                       <br> ----- BEGIN CERTIFICATE REQUEST-----<br>
                                       MIICzTCCAbUCAQAwgYcxCzAJBgNVBAYTAk5MMRYwFAYDVQQIEw1Ob29yZC1Ib2xs&gt;
                                       <br>YW5kMRYwFAYDVQQHEw1IZWVyaHVnb3dhYXJkMSEwHwYDVQQKExhYb2xwaGluIFNT<br>
                                       .....
                                       <br>xg==<br>
                                       -----END CERTIFICATE REQUEST -----'>
                                        <img class="img-circle" src="modules/addons/sslcertificates/img/icon_info.png" alt="info">
                                    </a>
                                </label>
                                    
                                <textarea class="form-control" name="csr" cols="50" rows="10"></textarea>

                                <div class="decodeCSR">
                                    <div class="brdr">
                                        <label for="label_extra_domains" class="control-label h3style">
                                            <font>
                                            <font class=""><strong>{$lang['sslXolphinServerCSRData']}</strong></font>
                                            </font>
                                        </label>
                                    </div>
                                    <div class="brdr" style="padding-top: 10px;">
                                        <ul class="list">
                                            <li style="list-style: none;"><font><font>{$lang['sslXolphinServerComName']}: </font></font><span
                                                    id="label_company"></span></li>
                                            <li style="list-style: none;"><font><font>{$lang['sslXolphinServerDomain']}: </font></font><span
                                                    id="label_domain"></span></li>
                                        </ul>
                                    </div>
                                </div>
                                                    
                                <div class="approver-emails brdr">
                                    <div class="form-group">
                                        <label for="approverEmail">{$lang['sslXolphinServerAppEmail']}</label>
                                        <select name="approverEmail" id="approverEmail" class="form-control" disabled>
                                            <option value="{$order.approverEmail}">{$order.approverEmail}</option>
                                        </select>
                                    </div>
                                </div>
                                        
                                {if $info.sanNames}
                                    <div class="extra" style="margin-top: 10px;">
                                        <div class="input-group box col-lg-6">
                                            <label for="extra-domain">{$lang['sslXolphinServerExtDomain']}</label>
                                            <ul name="extra-domain" class="form-group">
                                                {foreach from=$info.sanNames item=domain}
                                                    <li>
                                                        {$domain}
                                                    </li>
                                                {/foreach}
                                            </ul>
                                        </div>
                                    </div>
                                {/if}
                                
                                <div class="form-group">
                                    <label for="validationType" class="h3style"><strong>{$lang['sslXolphinServerValidType']}</strong></label>
                                    <select name="validationType" id="validationType" class="form-control" disabled>
                                        {if $order.dcvType == 'EMAIL'}
                                            <option value="EMAIL" selected>{$lang['sslXolphinServerEmail']}</option>
                                        {elseif $order.dcvType == 'DNS'}
                                            <option value="DNS" selected>{$lang['sslXolphinServerCName']}</option>
                                        {else}
                                            <option value="FILE" selected>{$lang['sslXolphinServerUplFile']}</option>
                                        {/if}
                                    </select>
                                </div>
                            </div>
                        {/if}
                        
                        <div class="col-xs-6 contact-information">
                            <div class="brdr">
                                <label for="label_extra_domains" class="control-label h3style">
                                    <font>
                                    <font class=""><h4>{$lang['sslXolphinServerContactInf']}:</h4></font>
                                    </font>
                                </label>
                            </div>
                            <div style="margin-top: 10px;">
                                <label for="company">{$lang['sslXolphinServerCompany']}</label>
                                <input type="text" name="company" id="company" class="form-control" value="{$order.company}"
                                       readonly>
                            </div>
                            <div style="margin-top: 10px;">
                                <label for="address">{$lang['sslXolphinServerAddress']}</label>
                                <input type="text" name="address" id="address" class="form-control" value="{$order.address}"
                                       readonly>
                            </div>
                            <div style="margin-top: 5px;">
                                <label for="city">{$lang['sslXolphinServerCity']}</label>
                                <input type="text" name="city" id="city" class="form-control" value="{$order.city}"
                                       readonly>
                            </div>
                            <div style="margin-top: 5px;">
                                <label for="zipcode">{$lang['sslXolphinServerZipCode']}</label>
                                <input type="text" name="zipcode" id="zipcode" class="form-control" value="{$order.zipcode}"
                                       readonly>
                            </div>
                            <div style="margin-top: 5px;">
                                <label for="approverFirstName">{$lang['sslXolphinServerAppFirstName']}</label>
                                <input type="text" name="approverFirstName" id="approverFirstName" class="form-control"
                                       value="{$order.approverFirstName}" readonly>
                            </div>
                            <div style="margin-top: 5px;">
                                <label for="approverLastName">{$lang['sslXolphinServerAppLastName']}</label>
                                <input type="text" name="approverLastName" id="approverLastName" class="form-control"
                                       value="{$order.approverLastName}" readonly>
                            </div>
                            <div style="margin-top: 5px;">
                                <label for="approverPhone">{$lang['sslXolphinServerAppPhone']}</label>
                                <input type="text" name="approverPhone" id="approverPhone" class="form-control"
                                       value="{$order.approverPhone}" readonly>
                            </div>
                        </div>
                        <span class="col-xs-12 reissue" style="top: 10px; padding-bottom: 10px;">
                            <button type="submit" id="reissueCert" class="btn btn-primary center-block">{$lang['sslXolphinServerReissue']}</button>
                        </span>
                    </form>
                </div>
            </div>
        </div>
    </div>
                        
    {if $type == 'MULTI'}
        <div style="margin:0 0 10px 0;padding:10px 35px;background-color:#ffffd2;color:#555;font-size:16px;text-align:center;">
            {$lang['sslXolphinServerManageSan']}
        </div>
        <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
            <div class="panel panel-default">
                <div class="panel-heading success" role="tab" id="headingSan">
                    <h4 class="panel-title">
                        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseSan"
                           aria-expanded="false" aria-controls="collapseSan">
                            {$lang['sslXolphinServerManSanName']}
                        </a>
                    </h4>
                </div>
                <div id="collapseSan" class="panel-collapse collapse" role="tabpanel"
                     aria-labelledby="headingSan">
                    <div class="panel-body">
                        <form method="post"
                              action="clientarea.php?action=productdetails&id={$serviceid}&modop=custom&a=reissue"
                              id="manageSAN">
                            <input type="hidden" name="id" value="{$serviceid}"/>
                            <input type="hidden" name="modop" value="custom"/>
                            <input type="hidden" name="a" value="reissue"/>
                            <input type="hidden" name="certificate" value="reissue"/>
                            <input type="hidden" name="extra" value="true"/>
                            <input type="hidden" name="remove" value="false"/>
                            <table class="table table-list dataTable no-footer dtr-inline" role="grid">                                
                                <thead>
                                    <tr class="info">
                                        <td>{$lang['sslXolphinServerType']}</td>
                                        <td>{$lang['sslXolphinServerDomain']}</td>
                                        <td></td>
                                        <td style="text-align: center;">{$lang['sslXolphinServerAction']}</td>
                                    </tr>
                                </thead>
                                {if $auto}
                                    <tr>
                                        <td>{$lang['sslXolphinServerMain']}</td>
                                        <td>{$info.domain}</td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                {/if}
                                {foreach from=$info.sanNames item=domain}
                                    <tr>
                                        <td>{$lang['sslXolphinServerSan']}</td>
                                        <td>{$domain}</td>
                                        <td><input type="hidden" name="reissueDomain[]" value="{$domain}"/></td>
                                        <td class="removeReissueDomain" style="text-align: center; color: #f60000;">{$lang['sslXolphinServerRemove']}</td>
                                    </tr>
                                {foreachelse}
                                    <tr class="alert alert-warning">
                                        <td>{$lang['sslXolphinServerSan']}</td>
                                        <td>{$lang['sslXolphinServerNoDisplay']}</td>
                                        <td></td>
                                        <td></td>
                                    </tr>
                                {/foreach}
                            </table>
                            <div class="reissue" style="margin-top: 10px;">
                                <div class="input-group box col-lg-6">
                                    <label for="reissue-domain">{$lang['sslXolphinServerEntExtDomain']}</label>
                                    <input type="text" name="reissue-domain" id="reissue_domain" class="form-control">
                                    <span class="input-group-btn extra-domain" style="top: 13px;">
                                        <button type="button" id="add_reissue_domain" class="btn btn-primary">{$lang['sslXolphinServerAdd']}</button>
                                    </span>
                                </div>
                            </div>
                            <div class="reissueDomainList">
                                <div>
                                    <ul style="list-style-type: decimal;" id="reissue-domain-list"></ul>
                                </div>
                            </div>
                            <span class="input-group reissue" style="top: 10px; padding-bottom: 10px;">
                                <button type="submit" id="reissue" class="btn btn-primary">{$lang['sslXolphinServerReissue']}</button>
                            </span>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    {/if}
    
    <div class="modal fade bs-example-modal-sm" tabindex="-1" id="modalClientAria" role="dialog" aria-labelledby="reissueLargeModalLabel">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="reissueLargeModalLabel">{$lang['sslXolphinServerManSanName']}</h4>
                </div>
                <div class="modal-body">
                    {$lang['sslXolphinServerDelExtDomain']}
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">{$lang['sslXolphinServerClose']}</button>
                    <button type="button" class="btn btn-primary" id="confirm">{$lang['sslXolphinServerConfirm']}</button>
                </div>
            </div>
        </div>
    </div>
    {foreach from=$js item=file}
        <script type="text/javascript" src="modules/servers/sslcertificates/{$file}"></script>
    {/foreach}
    
    <script type="text/javascript" src="modules/addons/sslcertificates/js/main.js"></script>
{else}    
    <div class="alert alert-warning">{$lang['sslXolphinServerCertNoValid']}</div>
{/if}

<hr>

{include file="$dir/templates/back.tpl"}
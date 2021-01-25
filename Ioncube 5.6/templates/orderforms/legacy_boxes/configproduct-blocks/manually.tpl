<div class="notifications col-xs-12" style="margin-top: 5px; display:none" id='man-notif'>
    <div class="alert alert-danger error-result"></div>
</div>
<div class="accountOutsideHosting col-xs-6">
    <label for="csr" class="h3style" style="margin-top: 5px;"><strong>{$lang['sslXolphinServerCSR']}</strong>
        <a rel='popover'
           class="info-popover img-circle"
           data-placement='right'
           style="width: 650px;"
           data-toggle="tooltip" title="{$lang['sslXolphinInformationCSR']}"
        >
            <i class="fas fa-info-circle" style="color:#0099CC;"></i>
        </a>
    </label>
    <textarea class="form-control" name="csr" cols="50" rows="10"></textarea>
    <div class="decodeCSR">
        <div class="brdr">
            <label for="label_extra_domains" class="control-label h3style">

                <font class=""><strong>{$lang['sslXolphinServerCSRData']}</strong></font>
            </label>
        </div>
        <div class="brdr"  style="padding-top: 10px;">
            <ul class="list">
                <li style="list-style: none;"><font><font>{$lang['sslXolphinServerComName']}: </font></font><span id="label_company"></span></li>
                <li style="list-style: none;"><font><font>{$lang['sslXolphinServerDomain']}: </font></font><span id="label_domain"></span></li>
            </ul>
        </div>
    </div>
    <div class="approver-emails brdr">
        <div class="form-group">
            <label for="approverEmail">{$lang['sslXolphinInformationSelAppEmail']}</label>
            <select name="approverEmail" id="approverEmail" class="form-control">
            </select>
        </div>
    </div>
    <div class="extra" style="margin-top: 10px;">
        <div class="input-group box col-lg-6">
            <label for="extra-domain">{$lang['sslXolphinServerEntExtDomain']}</label>
            <input type="text" name="extra-domain" id="extra_domain" class="form-control" >
            <span class="input-group-btn extra-domain" style="top: 14px;">
                <button type="button" id="add_extra_domain" class="btn btn-primary">{$lang['sslXolphinServerAdd']}</button>
            </span>
        </div>
        <p style="font-size: 10px;">{$lang['sslXolphinInformationValidDomEm']}</p>
    </div>
    <div class="extraDomainList brdr">
        <div>
            <input type="hidden" name="extra-domain-list[]">
            <ul style="list-style-type: decimal;" id="extra-domain-list"></ul>
        </div>
    </div>
    <div class="form-group">
        <label for="validationType" class="h3style"><strong>{$lang['sslXolphinInformationSelValidType']}</strong>
            <a rel='popover'
               class="info-popover img-circle"
               data-placement='right'
               style="width: 650px;"
               data-toggle="tooltip" title="{$lang['sslXolphinInformationEmailValid']}">
                <i class="fas fa-info-circle" style="color:#0099CC;"></i>
            </a>
        </label>
        <select name="validationType" id="validationType" class="form-control">
            <option value="">-- {$lang['sslXolphinInformationSelValidType']} --</option>
            <option value="EMAIL">{$lang['sslXolphinServerEmail']}</option>
            <option value="DNS">{$lang['sslXolphinServerCName']}</option>
            <option value="FILE">{$lang['sslXolphinServerUplFile']}</option>
        </select>
    </div>
</div>

<div class="col-xs-6 contact-information" id="contact-info-man">
    {include file="orderforms/$carttpl/configproduct-blocks/contact-information.tpl"}
</div>
<div class="col-xs-12"></div>
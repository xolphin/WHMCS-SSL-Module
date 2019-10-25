<div class="notifications col-xs-12" style="margin-top: 5px; display:none" id='man-notif'>
    <div class="alert alert-danger error-result"></div>
</div>
<div class="accountNoCSR col-xs-6" style="display:none">
    <label for="domainNoCSR" class="h3style" style="margin-top: 5px;"><strong>{$lang['sslXolphinServerDomain']}</strong>
    </label>
    <input class="form-control" name="domainNoCSR"  id="domainNoCSR" />
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
        </label>
        <select name="validationType" id="validationType" class="form-control">
            <option value="">-- {$lang['sslXolphinInformationSelValidType']} --</option>
            <option value="EMAIL">{$lang['sslXolphinServerEmail']}</option>
            <option value="DNS">{$lang['sslXolphinServerCName']}</option>
            <option value="FILE">{$lang['sslXolphinServerUplFile']}</option>
        </select>
    </div>
</div>

<div class="col-xs-6 contact-information" style="display:none" id="contact-info-man-nocsr">
    {include file="orderforms/$carttpl/configproduct-blocks/contact-information.tpl"}
</div>
<div class="col-xs-12"></div>
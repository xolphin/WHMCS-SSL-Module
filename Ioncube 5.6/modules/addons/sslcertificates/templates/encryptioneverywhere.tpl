
<div class="infoMultidomain col-xs-12" style="margin-top: 5px; display:none;">
    <div class="bg-warning">
        {$lang['sslXolphinInformationInfoMultidomain']}
    </div>
</div>
<div class="notifications col-xs-12" style="margin-top: 5px; display:none" id="auto-notif">
    <div class="alert alert-danger error-result"></div>
</div>

<div class="successCheckEE col-xs-6" style="display:none">
    <div style="margin-top: 10px;">
        <div class="input-group box col-lg-6">
            <label for="domainEE">{$lang['sslXolphinInformationDomName']}</label>
            <input type="text" name="domainEE" id="domainEE" class="form-control" required>
            <p style="font-size: 10px;">{$lang['sslXolphinInformationValidDomEm']}</p>
        </div>
        <input type="button" id="getApproverEmails" value="Get e-mails" class="btn btn-primary btn-sm emails-button">

        <div class="approver-emails">
            <div class="form-group">
                <label for="approverEmail">{$lang['sslXolphinInformationSelAppEmail']}</label>
                <select name="approverEmail" id="approverEmail" class="form-control">
                </select>
            </div>
        </div>

        <div class="form-group" style="margin-top: 10px;">
            <label for="validationType">{$lang['sslXolphinInformationSelValidType']}</label>
            <select name="validationType" id="validationType" class="form-control">
                <option value="">-- {$lang['sslXolphinInformationSelValidType']} --</option>
                <option value="DNS">{$lang['sslXolphinServerCName']}</option>
                <option value="FILE">{$lang['sslXolphinServerUplFile']}</option>
            </select>
        </div>
    </div>
</div>

<div class="col-xs-6 contact-information" id="contact-info-ee" style='display:none'>
    <div style="float: right; width: 100%;">
        {include file="orderforms/$carttpl/configproduct-blocks/contact-information.tpl"}
    </div>
</div>

<div class="col-xs-12"></div>
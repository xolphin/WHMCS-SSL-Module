<div class="brdr">
    <label for="label_extra_domains" class="control-label h3style">
        <font>
        <font class=""><h4>{$lang['sslXolphinServerContactInf']}:</h4></font>
        </font>
    </label>
</div>
<div style="margin-top: 10px;">
    <label for="company">{$lang['sslXolphinServerCompany']}</label>
    <input type="text" name="company" id="company" class="form-control" required>
</div>
<div  style="margin-top: 10px;">
    <label for="address">{$lang['sslXolphinServerAddress']}</label>
    <input type="text" name="address" id="address" class="form-control" required>
</div>
<div style="margin-top: 5px;">                        
    <label for="country">{$lang['sslXolphinServerCountry']}</label>
    <select name="country" id="country" class="form-control" required></select>
</div>
<div style="margin-top: 5px;">
    <label for="city">{$lang['sslXolphinServerCity']}</label>
    <input type="text" name="city" id="city" class="form-control" required>
</div>
{if $validation eq "OV" || $validation eq "EV"}
<div style="margin-top: 10px;">
    <label for="province">{$lang['sslXolphinServerState']}</label>
    <input type="text" name="province" id="province" class="form-control" required>
</div>
{else}
<div style="margin-top: 10px;">
    <label for="state">{$lang['sslXolphinServerState']}</label>
    <input type="text" name="state" id="state" class="form-control" required>
</div>
{/if}
<div style="margin-top: 5px;">
    <label for="zipcode">{$lang['sslXolphinServerZipCode']}</label>
    <input type="text" name="zipcode" id="zipcode" class="form-control" required>
</div>
{if $validation eq "OV" || $validation eq "EV"}
<div style="margin-top: 5px;">
    <label for="approverRepresentativeFirstName">{$lang['sslXolphinServerAppRepresentativeFirstName']}</label>
    <input type="text" name="approverRepresentativeFirstName" id="approverRepresentativeFirstName" class="form-control" required>
</div>
<div style="margin-top: 5px;">
    <label for="approverRepresentativeLastName">{$lang['sslXolphinServerAppRepresentativeLastName']}</label>
    <input type="text" name="approverRepresentativeLastName" id="approverRepresentativeLastName" class="form-control" required>
</div>
<div style="margin-top: 5px;">
    <label for="approverRepresentativePhone">{$lang['sslXolphinServerAppRepresentativePhone']}</label>
    <input pattern="^\+?[0-9]*$" type="tel" name="approverRepresentativePhone" id="approverRepresentativePhone" class="form-control" required>
</div>
<div style="margin-top: 5px;">
    <label for="approverRepresentativeEmail">{$lang['sslXolphinServerAppRepresentativeEmail']}</label>
    <input type="email" name="approverRepresentativeEmail" id="approverRepresentativeEmail" class="form-control" required>
</div>
<div style="margin-top: 5px;">
    <label for="approverRepresentativePosition">{$lang['sslXolphinServerAppRepresentativePosition']}</label>
    <input type="text" name="approverRepresentativePosition" id="approverRepresentativePosition" class="form-control" required>
</div>
{else}
    <div style="margin-top: 10px;">
        <label for="state">{$lang['sslXolphinServerState']}</label>
        <input type="text" name="state" id="state" class="form-control" required>
    </div>
<div style="margin-top: 5px;">
    <label for="zipcode">{$lang['sslXolphinServerZipCode']}</label>
    <input type="text" name="zipcode" id="zipcode" class="form-control" required>
</div>
{/if}

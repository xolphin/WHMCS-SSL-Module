<div class="infoMultidomain col-xs-12" style="margin-top: 5px;">
    <div class="bg-warning">
        <strong>Multidomain certificate can not be validated and installed automatically.
            You will need to validate it manually according to the type, you chose.
            <br>After order and payment are completed, you will be able to check the Validation instructions in your Services.
            <br>The certificate will be available in your Services after validation process is completed successfully.
        </strong>
    </div>
</div>
<div class="notifications col-xs-12" style="margin-top: 5px;">
    <div class="alert alert-danger error-result"></div>
</div>
<div class="successCheck col-xs-6">
    <div style="margin-top: 10px;">
        <div class="input-group box col-lg-6">
            <label for="domain">Enter your Domain name</label>
            <input type="text" name="domain" id="domain" class="form-control" placeholder="google.com" required>
            <p style="font-size: 10px;">Enter valid domain to be able to get E-mails for approving</p>
        </div>
        <input type="button" id="getApproverEmails" value="Get e-mails" class="btn btn-primary btn-sm emails-button">

        <div class="approver-emails">
            <div class="form-group">
                <label for="approverEmail">Select approver e-mail</label>
                <select name="approverEmail" id="approverEmail" class="form-control">
                </select>
            </div>
        </div>
        <div class="extra" style="margin-top: 10px;">
            <div class="input-group box col-lg-6">
                <label for="extra-domain">Enter extra Domain name</label>
                <input type="text" name="extra-domain" id="extra_domain" class="form-control" placeholder="google.com">
                <span class="input-group-btn extra-domain" style="top: 14px;">
                    <button type="button" id="add_extra_domain" class="btn btn-primary">Add</button>
                </span>
            </div>
            <p style="font-size: 10px;">Enter valid domain to be able to get E-mails for approving</p>
        </div>
        <div class="extraDomainList">
            <div>
                <input type="hidden" name="extra-domain-list[]">
                <ul style="list-style-type: decimal;" id="extra-domain-list"></ul>
            </div>
        </div>
        <div class="form-group" style="margin-top: 10px;">
            <label for="validationType">Select validation type</label>
            <select name="validationType" id="validationType" class="form-control">
                <option value=""></option>
                <option value="EMAIL">E-mail</option>
                <option value="DNS">CNAME</option>
                <option value="FILE">Upload file</option>
            </select>
        </div>
    </div>
</div>
<div class="col-xs-6 contact-information">
    <div style="float: right; width: 75%;">
        <div class="brdr">
            <label for="label_extra_domains" class="control-label h3style">
                <font>
                <font class=""><h4>Contact Information:</h4></font>
                </font>
            </label>
        </div>
        <div style="margin-top: 10px;">
            <label for="company">Company</label>
            <input type="text" name="company" id="company" class="form-control" placeholder="" required>
        </div>
        <div style="margin-top: 10px;">
            <label for="address">Address</label>
            <input type="text" name="address" id="address" class="form-control" placeholder="" required>
        </div>
        <div style="margin-top: 5px;">
            <label for="city">City</label>
            <input type="text" name="city" id="city" class="form-control" placeholder="" required>
        </div>
        <div style="margin-top: 5px;">
            <label for="zipcode">Zip Code</label>
            <input type="text" name="zipcode" id="zipcode" class="form-control" placeholder="" required>
        </div>
        <div style="margin-top: 5px;">
            <label for="approverFirstName">Approver First Name</label>
            <input type="text" name="approverFirstName" id="approverFirstName" class="form-control" placeholder=""
                   required>
        </div>
        <div style="margin-top: 5px;">
            <label for="approverLastName">Approver Last Name</label>
            <input type="text" name="approverLastName" id="approverLastName" class="form-control" placeholder=""
                   required>
        </div>
        <div style="margin-top: 5px;">
            <label for="approverPhone">Approver Phone</label>
            <input type="text" name="approverPhone" id="approverPhone" class="form-control" placeholder=""
                   required>
        </div>
    </div>
</div>
<div class="col-xs-12"></div>
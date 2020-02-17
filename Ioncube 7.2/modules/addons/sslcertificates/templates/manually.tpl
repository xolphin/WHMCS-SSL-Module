<div class="notifications col-xs-12" style="margin-top: 5px;">
    <div class="alert alert-danger error-result"></div>
</div>

<div class="accountOutsideHosting col-xs-6">
    <label for="crs" class="h3style" style="margin-top: 5px;"><strong>Your CSR</strong>
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
            <i class="fas fa-info-circle" style="color:#0099CC;"></i>

        </a>
    </label>
    
    <textarea class="form-control" name="csr" cols="50" rows="10"></textarea>
    
    <div class="decodeCSR">
        <div class="brdr">
            <label for="label_extra_domains" class="control-label h3style">
                <font>
                <font class=""><strong>CSR data</strong></font>
                </font>
            </label>
        </div>
        <div class="brdr"  style="padding-top: 10px;">
            <ul class="list">
                <li style="list-style: none;"><font><font>Company Name: </font></font><span id="label_company"></span></li>
                <li style="list-style: none;"><font><font>Domain name: </font></font><span id="label_domain"></span></li>
            </ul>
        </div>
    </div>
    
    <div class="approver-emails brdr">
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
    
    <div class="extraDomainList brdr">
        <div>
            <input type="hidden" name="extra-domain-list[]">
            <ul style="list-style-type: decimal;" id="extra-domain-list"></ul>
        </div>
    </div>
    
    <div class="form-group">
        <label for="validationType" class="h3style"><strong>Select validation type</strong>
            <a rel='popover'
               class="info-popover img-circle"
               data-placement='right'
               style="width: 650px;"
               data-original-title="&lt;b&gt;Validation Information&lt;/b&gt;"
               data-content="<strong>Email validation</strong><br>
               Email will be sent to mailboxes admin-, administrator-, webmaster-, hostmaster-, of postmaster@domainname.tld<br>
               <strong>CNAME validation</strong><br>
               Place a CNAME DNS record with specific content.<br>
               <strong>File validation</strong><br>
               Place a file on your website with specific content.">
                <i class="fas fa-info-circle" style="color:#0099CC;"></i>
            </a>
        </label>
        <select name="validationType" id="validationType" class="form-control">
            <option value=""></option>
            <option value="EMAIL">E-mail</option>
            <option value="DNS">CNAME</option>
            <option value="FILE">Upload file</option>
        </select>
    </div>
</div>

<div class="col-xs-6 contact-information">
    <div class="brdr">
        <label for="label_extra_domains" class="control-label h3style">
            <font>
            <font class=""><h4>Contact Information:</h4></font>
            </font>
        </label>
    </div>
    <div style="margin-top: 10px;">
        <label for="company">Company</label>
        <input type="text" name="company" id="company" class="form-control" required>
    </div>
    <div  style="margin-top: 10px;">
        <label for="address">Address</label>
        <input type="text" name="address" id="address" class="form-control" required>
    </div>
    <div style="margin-top: 5px;">
        <label for="city">City</label>
        <input type="text" name="city" id="city" class="form-control" required>
    </div>
    <div style="margin-top: 5px;">
        <label for="zipcode">Zip Code</label>
        <input type="text" name="zipcode" id="zipcode" class="form-control" required>
    </div>
    <div style="margin-top: 5px;">
        <label for="approverFirstName">Approver First Name</label>
        <input type="text" name="approverFirstName" id="approverFirstName" class="form-control" placeholder="" required>
    </div>
    <div style="margin-top: 5px;">
        <label for="approverLastName">Approver Last Name</label>
        <input type="text" name="approverLastName" id="approverLastName" class="form-control" placeholder="" required>
    </div>
    <div style="margin-top: 5px;">
        <label for="approverPhone">Approver Phone</label>
        <input type="text" name="approverPhone" id="approverPhone" class="form-control" required>
    </div>
</div>

<div class="col-xs-12"></div>
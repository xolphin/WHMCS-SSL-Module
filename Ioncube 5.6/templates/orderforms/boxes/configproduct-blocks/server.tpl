<h3>{$LANG.cartconfigserver}</h3>

<div class="fields-container">
    <div class="field-row clearfix">
        <div class="col-sm-4">{$LANG.serverhostname}</div>
        <div class="col-sm-8 row">
            <div class="col-xs-4">
                <input type="text" name="hostname" value="{$server.hostname}" class="form-control"/>
            </div>
            <div class="col-xs-8">
                <p class="form-control-static">{$LANG.serverhostnameexample}</p>
            </div>
        </div>
    </div>
    <div class="field-row clearfix">
        <div class="col-sm-4">{$LANG.serverns1prefix}</div>
        <div class="col-sm-8 row">
            <div class="col-xs-3">
                <input type="text" name="ns1prefix" value="{$server.ns1prefix}" class="form-control"/>
            </div>
            <div class="col-xs-9">
                <p class="form-control-static">{$LANG.serverns1prefixexample}</p>
            </div>
        </div>
    </div>
    <div class="field-row clearfix">
        <div class="col-sm-4">{$LANG.serverns2prefix}</div>
        <div class="col-sm-8 row">
            <div class="col-xs-3">
                <input type="text" name="ns2prefix" value="{$server.ns2prefix}" class="form-control"/>
            </div>
            <div class="col-xs-9">
                <p class="form-control-static">{$LANG.serverns2prefixexample}</p>
            </div>
        </div>
    </div>
    <div class="field-row clearfix">
        <div class="col-sm-4">{$LANG.serverrootpw}</div>
        <div class="col-sm-8 row">
            <div class="col-xs-3">
                <input type="password" name="rootpw" value="{$server.rootpw}" class="form-control"/>
            </div>
        </div>
    </div>
</div>
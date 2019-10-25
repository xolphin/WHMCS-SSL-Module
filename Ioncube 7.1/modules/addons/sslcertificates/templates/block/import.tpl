<div class="before-install-box">
    <form method="post">
        <input type="hidden" name="install" value="products">
        <p>{$lang['sslXolphinCertificatesAutoInst']}</p>


        <div id="auto_install">
            {foreach from=$groups item=group}

                <div class="form-group">
                    <div class="col-sm-12">
                        <div class="checkbox">
                            <label><input type="checkbox" name="groups[]" value="{$group}"
                                > {$group}</label>
                        </div>
                    </div>
                </div>
            {/foreach}
        </div>

        <div class="form-group">
            <div class="col-sm-offset-1 col-sm-6">
                <button type="submit" class="btn btn-default">Install / Sync</button>
            </div>
        </div>
    </form>
</div>
</div>
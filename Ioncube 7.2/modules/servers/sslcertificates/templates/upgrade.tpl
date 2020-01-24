<h2>{$lang['sslXolphinServerUpgrade']}</h2>
{if isset($smarty.session.xolphin.error)}
    <div class="alert alert-danger">
        <p><strong>{$lang['sslXolphinServerErrorOccured']}:</strong> {$smarty.session.xolphin.error}</p>
    </div>
{/if}
{if !isset($smarty.session.xolphin.error)}
    <table class="table table-list dataTable no-footer dtr-inline" role="grid">
        <thead>
            <tr>
                <th>{$lang['sslXolphinServerBrand']}</th>
                <th>{$lang['sslXolphinServerProduct']}</th>
                <th>{$lang['sslXolphinServerType']}</th>
                <th>{$lang['sslXolphinServerUpgrade']}</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            {foreach from=$products item=row}
                <tr>
                    <td>{$row->brand}</td>
                    <td>{$row->name}</td>
                    <td>{$row->type}</td>
                    <td><a href="cart.php?a=add&pid={$row->pid}"><button type="button" id="upgradeCert" class="btn btn-success center-block popup">{$lang['sslXolphinServerUpgrade']}</button></a></td>
                </tr>
            {foreachelse}
                <tr class="alert alert-warning">
                    <td colspan="2">{$lang['sslXolphinServerNoDisplay']}</td>
                </tr>
            {/foreach}
        </tbody>
    </table>
{/if}
<hr>
{include file="$dir/templates/back.tpl"}
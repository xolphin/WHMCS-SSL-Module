<h2>{$lang['sslXolphinServerStatHist']}</h2>

    <table class="table table-list dataTable no-footer dtr-inline" role="grid">
        <thead>
            <tr role="row">
                <th>{$lang['sslXolphinServerDate']}</th>
                <th>{$lang['sslXolphinServerMessage']}</th>
            </tr>
        </thead>
        <tbody>
        {foreach from=$logs item=row}
            <tr>
                <td>{$row->created_at}</td>
                <td>{$row->message}</td>
            </tr>
            {foreachelse}
            <tr class="alert alert-warning">
                <td colspan="2">{$lang['sslXolphinServerNoDisplay']}</td>
            </tr>
        {/foreach}
        </tbody>
    </table>
<hr>
{include file="$dir/templates/back.tpl"}
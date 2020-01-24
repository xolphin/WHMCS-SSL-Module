<div id="products" class="tab-pane fade">
    {include file='block/message.tpl'}
    <form id="certificates-modify" method="POST">
        <input type="hidden" name="install" value="enable_disable">

{foreach from=$products key=group item=group_products}

    <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
        <div class="panel panel-default">
            <div class="panel-heading success" role="tab" id="heading{$group}">
                <div class="col-md-8">
                    <h4 class="panel-title">
                        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse{$group}"
                           aria-expanded="true" aria-controls="collapse{$group}">
                            {$lang['sslXolphinCertificates']} {$group}
                        </a>
                    </h4>
                </div>

                <div class="col-md-2 pull-right">
                    <label>
                        <input type="checkbox"> Check all
                    </label>
                </div>
                <div class="clearfix"></div>
            </div>
            <div id="collapse{$group}" class="panel-collapse collapse in" role="tabpanel"
                 aria-labelledby="heading{$group}">
                <div class="panel-body">
                    <table class="table table-inverse table-striped table-hover">
                        <thead>
                            <tr class="alert alert-info">
                                <th scope="row">#</th>
                                <th>{$lang['sslXolphinServerName']}</th>
                                <th>{$lang['sslXolphinServerType']}</th>
                                <th class="text-center">{$lang['sslXolphinServerValidation']}</th>
                                <th class="text-center">{$lang['sslXolphinServerStatus']}</th>
                                <th class="text-center"></th>
                            </tr>
                        </thead>
                        <tbody>
                            {foreach from=$group_products key=key item=product}
                                <tr data-id="{$product->id}" data-status="{$product->status}">
                                    <td class="col-md-1" scope="row">{$key + 1}</td>
                                    <td class="col-md-5">{$product->name}</td>
                                    <td>{$product->type}</td>
                                    <td class="text-center col-md-2">{$product->validation}</td>
                                    {if $product->status eq "installed"}
                                        <td class="text-success text-center col-md-2">{$product->status}</td>
                                    {else}
                                        <td class="text-danger text-center col-md-2">{$product->status}</td>
                                    {/if}
                                    <td class=" text-center col-md-2"><input data-id="{$product->id}" data-status="{$product->status}" type="checkbox" name="products[]" value="{$product->id}"></td>
                                </tr>
                            {/foreach}
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
{/foreach}
{if count($products)}
    <div id="ssl-products-toolbar" class="btn-toolbar pull-right" role="toolbar">

            <div class="btn-group">
                    <button class="btn btn-primary" name="enable">Enable</button>
            </div>&nbsp;
            <div class="btn-group">
                    <button class="btn btn-danger" name="disable">Disable</button>
            </div>

    </div>
    </form>
{/if}
{literal}
    <script type="text/javascript">
        $(function () {
            var global_checkboxes = {'installed': [], 'disabled': []};

            $('.settings-link').on('click', function (e) {
                e.preventDefault();
                $(this).next('.settings-form').toggle('slow');
            });

            $('.panel-group#accordion .panel-heading [type="checkbox"]').on('click',function(){
                if($(this).prop("checked")){
                    $(this).closest('.panel-group').find('[type="checkbox"]').prop("checked", true);
                }else{
                    $(this).closest('.panel-group').find('[type="checkbox"]').prop("checked", false);
                }

            });

            $('.panel-group#accordion tr td [type="checkbox"]').on('click',function(){


            });




        });
    </script>
{/literal}
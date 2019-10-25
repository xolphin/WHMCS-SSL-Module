<div id="home" class="tab-pane  active">
    <div class="panel panel-default">

        <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
            <div class="panel panel-default">
                <div class="panel-heading success" role="tab" id="heading">
                    <div class="col-md-8">
                        <h4 class="panel-title">
                            <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse"
                               aria-expanded="true" aria-controls="collapse">
                                Failed Certificate Installations
                            </a>
                        </h4>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div id="collapse" class="panel-collapse collapse in" role="tabpanel"
                     aria-labelledby="heading">
                    <div class="panel-body">
                        <table class="table table-inverse table-striped table-hover">
                            <thead>
                            <tr class="alert alert-info">
                                <th>Request ID</th>
                                <th>Domain Name</th>
                                <th>Product</th>
                                <th>Issue Date</th>
                                <th>Process</th>


                            </tr>
                            </thead>
                            <tbody>


                            {foreach from=$certificates key=key item=certificate}
                                {$req=json_decode($certificate->crtData)}
                                    {if $certificate->autosetup == "Installation Failed"}
                                <tr data-id="{$req->id}" data-status="{$req->status}">
                                    <td >{$req->id}</td>
                                    <td >{$req->domainName}</td>
                                    <td >{$req->_embedded->product->brand} {$req->_embedded->product->name}</td>
                                    <td >{$req->dateIssued|date_format:('%d/%m/%Y')}</td>
                                    <td ><a href="{$smarty.server.REQUEST_URI}&id={$req->id}">Process</a></td>
                                </tr>
                                    {/if}
                            {/foreach}


                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

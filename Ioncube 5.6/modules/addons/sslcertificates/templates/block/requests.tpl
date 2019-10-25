<div id="requests" class="tab-pane fade">
<div class="panel panel-default">

    <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
        <div class="panel panel-default">
            <div class="panel-heading success" role="tab" id="heading">
                <div class="col-md-8">
                    <h4 class="panel-title">
                        <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse"
                           aria-expanded="true" aria-controls="collapse">
                            Pending Certificate Requests
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
                                <th>Org.</th>
                                <th>Whois</th>
                                <th>Docs</th>
                                <th>Phone</th>
                                <th>DCV</th>
                                <th>Key?</th>
                                <th>Date</th>

                            </tr>
                        </thead>
                        <tbody>


                        {foreach from=$requests key=key item=request}
                            {$req=json_decode($request->certificate)}
                            <tr data-id="{$request->id}" data-status="{$request->status}">
                                <td >{$req->id}</td>
                                <td >{$req->domainName}</td>
                                <td >{$req->_embedded->product->brand} {$req->_embedded->product->name}</td>

                                {if (!isset($req->validations->organization->status))}
                                    <td>N/A</td>
                                {elseif ($req->validations->organization->status == true)}
                                    <td><img src="images/success.png"></td>
                                {elseif ($req->validations->organization->status == false)}
                                    <td><img src="images/error.png"></td>
                                {/if}

                                {if (!isset($req->validations->whois->status))}
                                    <td>N/A</td>
                                {elseif ($req->validations->whois->status == true)}
                                    <td><img src="images/success.png"></td>
                                {elseif ($req->validations->whois->status == false)}
                                    <td><img src="images/error.png"></td>
                                {/if}

                                {if (!isset($req->validations->docs->status))}
                                    <td>N/A</td>
                                {elseif ($req->validations->docs->status == true)}
                                    <td><img src="images/success.png"></td>
                                {elseif ($req->validations->docs->status == false)}
                                    <td><img src="images/error.png"></td>
                                {/if}

                                {if (!isset($req->validations->phone->status))}
                                    <td>N/A</td>
                                {elseif ($req->validations->phone->status == true)}
                                    <td><img src="images/success.png"></td>
                                {elseif ($req->validations->phone->status == false)}
                                    <td><img src="images/error.png"></td>
                                {/if}

                                {if (!isset($req->validations->dcv->status))}
                                    <td>N/A</td>
                                {elseif ($req->validations->dcv->status == true)}
                                    <td><img src="images/success.png"></td>
                                {elseif ($req->validations->dcv->status == false)}
                                    <td><img src="images/error.png"></td>
                                {/if}

                                {if (!empty($request->pvtKey))}
                                    <td><img src="images/success.png"></td>
                                {else}
                                    <td><img src="images/error.png"></td>
                                {/if}

                                <td>{$req->dateOrdered|date_format:('%d/%m/%Y')}</td>
                            </tr>
                        {/foreach}


                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
</div>

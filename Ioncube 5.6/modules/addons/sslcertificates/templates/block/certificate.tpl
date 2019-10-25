<div id="certificates" class="tab-pane">
    {if isset($autoinstallResult)}
        <div class="infobox">
            <strong>
                <span class="title">Certificate installation will be retried</span>
            </strong>
            <br>
            <span class="message-text">During the next cron run, the installation will be once more retried.</span>
        </div>
    {/if}




    <div class="panel panel-default">

        <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
            <div class="panel panel-default">
                <div class="panel-heading success" role="tab" id="heading">
                    <div class="col-md-8">
                        <h4 class="panel-title">
                            <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapse"
                               aria-expanded="true" aria-controls="collapse">
                                Certificate Details
                            </a>
                        </h4>
                    </div>
                    <div class="clearfix"></div>
                </div>
                <div id="collapse" class="panel-collapse collapse in" role="tabpanel"
                     aria-labelledby="heading">
                    <div class="panel-body">

                        <table class="table table-inverse table-striped table-hover">

                            <tbody>
                            <tr>
                                <td style="width: 150px">Request ID</td>
                                <td>{$certificateDetails->id}</td>
                            </tr>
                            <tr>
                                <td style="width: 150px">Domain Name</td>
                                <td>{$certificateDetails->crtData->domainName}</td>
                            </tr>
                            <tr>
                                <td style="width: 150px">Issued</td>
                                <td>{$certificateDetails->crtData->dateIssued}</td>
                            </tr>
                            <tr>
                                <td style="width: 150px">Expires</td>
                                <td>{$certificateDetails->crtData->dateExpired}</td>
                            </tr>
                            <tr>
                                <td style="width: 150px">Status</td>
                                {if $certificateDetails->status == 0}

                                    <td>Order Pending at Xolphin</td>

                                {elseif $certificateDetails->status == 1}

                                    {if $certificateDetails->autosetup == "CSR provided by client"}

                                        <td>Certificate Issued. CSR provided by customer; Auto installation not possible</td>

                                    {elseif $certificateDetails->autosetup == "Installation Succesfull"}

                                        <td>Certificate Issued. Auto installation completed</td>

                                    {elseif $certificateDetails->autosetup == "Installation Failed"}

                                        <td>Certificate Issued. Auto installation Failed. <a href="{$smarty.server.SCRIPT_NAME}?module=sslcertificates&id={$smarty.request.id}&action=RetryInstall">Retry</a> or <a href="{$smarty.server.SCRIPT_NAME}?module=sslcertificates&id={$smarty.request.id}&action=Processed">Mark as Processed</a></td>

                                    {elseif $certificateDetails->autosetup == "Processed Manually"}

                                        <td>Certificate Issued. Processed Manually.</td>

                                    {/if}

                                {/if}
                                <td></td>
                            </tr>
                            <tr>
                                <td style="width: 150px">CRT</td>
                                {if isset($showCRT) }
                                    <td>{nl2br($showCRT)}</td>
                                {else}
                                    <td><a href="{$smarty.server.SCRIPT_NAME}?module=sslcertificates&id={$smarty.request.id}&action=showCRT">Show</a></td>
                                {/if}

                            </tr>
                            <tr>
                                <td style="width: 150px">Private Key</td>
                                {if isset($showKey) }
                                    <td>{nl2br($showKey)}</td>
                                {else}
                                    <td><a href="{$smarty.server.SCRIPT_NAME}?module=sslcertificates&id={$smarty.request.id}&action=showKey">Show</a></td>
                                {/if}
                            </tr>
                            <tr>
                                <td style="width: 150px">CSR</td>
                                {if isset($showCSR) }
                                    <td>{nl2br($showCSR)}</td>
                                {else}
                                    <td><a href="{$smarty.server.SCRIPT_NAME}?module=sslcertificates&id={$smarty.request.id}&action=showCSR">Show</a></td>
                                {/if}
                            </tr>
                            <tr>
                                <td style="width: 150px">CA Bundle</td>
                                {if isset($showCA) }
                                    <td>{nl2br($showCA)}</td>
                                {else}
                                    <td><a href="{$smarty.server.SCRIPT_NAME}?module=sslcertificates&id={$smarty.request.id}&action=showCA">Show</a></td>
                                {/if}
                            </tr>


                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

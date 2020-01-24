<h3>{$LANG.orderadditionalrequiredinfo}</h3>

<div class="fields-container">
    {foreach from=$customfields item=customfield}
        <div class="field-row clearfix">
            <div class="col-sm-4">{$customfield.name}</div>
            <div class="col-sm-8">
                {$customfield.input}{if $customfield.description}<br/>{$customfield.description}{/if}
            </div>
        </div>
    {/foreach}
</div>
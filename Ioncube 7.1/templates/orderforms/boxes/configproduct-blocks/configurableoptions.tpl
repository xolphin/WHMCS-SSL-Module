<h3>{$LANG.orderconfigpackage}</h3>

<div class="fields-container">
    {foreach from=$configurableoptions item=configoption}
        <div class="field-row clearfix">
            <div class="col-sm-4">{$configoption.optionname}</div>
            <div class="col-sm-8">
                {if $configoption.optiontype eq 1}
                    <select name="configoption[{$configoption.id}]" class="form-control select-inline">
                        <option value="default" selected="selected">-- choose --</option>
                        {foreach key=num2 item=options from=$configoption.options}
                            <option value="{$options.id}">{$options.name}</option>
                        {/foreach}
                    </select>
                {elseif $configoption.optiontype eq 2}
                    {foreach key=num2 item=options from=$configoption.options}
                        <label class="radio-inline">
                            <input type="radio"
                                   name="configoption[{$configoption.id}]"
                                   value="{$options.id}"{if $configoption.selectedvalue eq $options.id} checked="checked"{/if}> {$options.name}
                        </label>
                        <br/>
                    {/foreach}
                {elseif $configoption.optiontype eq 3}
                    <label class="checkbox-inline">
                        <input type="checkbox"
                               name="configoption[{$configoption.id}]"
                               value="1"{if $configoption.selectedqty} checked{/if}> {$configoption.options.0.name}
                    </label>
                {elseif $configoption.optiontype eq 4}
                    <input type="text" name="configoption[{$configoption.id}]"
                           value="{$configoption.selectedqty}" size="5">
                    x {$configoption.options.0.name}
                {/if}
            </div>
        </div>
    {/foreach}
</div>
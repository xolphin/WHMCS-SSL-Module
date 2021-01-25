<h3>{$LANG.cartaddons}</h3>

<div class="fields-container">
    {foreach from=$addons item=addon}
        <div class="field-row clearfix">
            <div class="col-sm-4"><label class="checkbox-inline">{$addon.checkbox} {$addon.name}</label>
            </div>
            <div class="col-sm-8">
                {$addon.description}<br/>
                <strong>{$addon.pricing}</strong>
            </div>
        </div>
    {/foreach}
</div>
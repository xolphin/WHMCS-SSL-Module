

{if $initial}
    {include file='block/message.tpl'}
    {include file='block/initial.tpl'}
{else}
    {if isset($smarty.get.id)}
        {include file='block/certificate.tpl'}
    {else}

        <ul class="nav nav-tabs">
            <li class="active"><a data-toggle="tab" href="#home">Home</a></li>
            <li><a data-toggle="tab" href="#requests">Requests</a></li>
            <li><a  data-toggle="tab" href="#certificates">Certificates</a></li>
            <li><a data-toggle="tab" href="#products">Product Management</a></li>
        </ul>
        <div class="tab-content">
            {include file='block/home.tpl'}
            {include file='block/requests.tpl'}
            {include file='block/certificates.tpl'}
            {include file='block/products.tpl'}
            {include file='block/import.tpl'}
        </div>

    {/if}

{/if}
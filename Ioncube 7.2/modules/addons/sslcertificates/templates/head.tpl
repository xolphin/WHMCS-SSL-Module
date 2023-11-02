{if $json}
    <script type="text/javascript">
        <!--//--><![CDATA[//><!--
        var rs = jQuery.extend(rs, {$json});
        //--><!]]>
    </script>
{/if}

{foreach from=$css item=file}
    <link type="text/css" href="{$system_url}modules/addons/{$module_name}/{$file}?{$cache_ver}" rel="stylesheet" />
{/foreach}

{foreach from=$js item=file}
    <script type="text/javascript" src="{$system_url}modules/addons/{$module_name}/{$file}?{$cache_ver}"></script>
{/foreach}

<script type="text/javascript">
    var lang = [];
    lang['sslXolphinInformationCertTypeWild'] = "{$lang['sslXolphinInformationCertTypeWild']}";
    lang['sslXolphinInformationOnlyComodo'] = "{$lang['sslXolphinInformationOnlyComodo']}";
    lang['sslXolphinInformationEntDomName'] = "{$lang['sslXolphinInformationEntDomName']}";
    lang['sslXolphinInformationNoHostPack'] = "{$lang['sslXolphinInformationNoHostPack']}";
    lang['sslXolphinInformationOrderCompSSL'] = "{$lang['sslXolphinInformationOrderCompSSL']}";
    lang['sslXolphinInformationEntWildcardDomName'] = "{$lang['sslXolphinInformationEntWildcardDomName']}";
    lang['sslXolphinInformationEntWildcardDomNameNormalOrder'] = "{$lang['sslXolphinInformationEntWildcardDomNameNormalOrder']}";
    lang['sslXolphinCertificatesDaysExp'] = "{$lang['sslXolphinCertificatesDaysExp']}";
    lang['sslXolphinCertificatesSure'] = "{$lang['sslXolphinCertificatesSure']}";
    lang['sslXolphinCertificatesSomeWrong'] = "{$lang['sslXolphinCertificatesSomeWrong']}";
</script>
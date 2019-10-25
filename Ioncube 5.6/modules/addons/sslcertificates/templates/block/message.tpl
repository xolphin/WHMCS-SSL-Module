{if isset($message.success)}
        <div class="successbox">
                <strong>
                        <span class="title">{$message.success.title}</span>
                </strong>
                <br>
                <span class="message-text">{$message.success.message}</span>
        </div>
{/if}

{if isset($message.warning)}
        <div class="infobox">
                <strong>
                        <span class="title">{$message.warning.title}</span>
                </strong>
                <br>
                <span class="message-text">{$message.warning.message}</span>
        </div>
{/if}

{if isset($message.error)}
        <div class="errorbox">
                <strong>
                        <span class="title">{$message.error.title}</span>
                </strong>
                <br>
                <span class="message-text">{$message.error.message}</span>
        </div>
{elseif isset($credentialsError)}
        <div class="errorbox">
                <strong>
                        <span class="title">Error</span>
                </strong>
                <br/>
                <span class="message-text">{$credentialsError}</span>
        </div>
{/if}
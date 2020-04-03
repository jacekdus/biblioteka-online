<!--
----- ERRORS -----
-->

{* 
const ERROR = 2;
const WARNING = 1;
const INFO = 0; 
*}
<p></p>
<div class="alert alert-warning" role="alert">
    <h5>Przykładowi użytkownicy[login/hasło/rola]: </h5>
    <ul>
        <li>admin/admin/admin</li>
        <li>librarian/lib/librarian</li>
        <li>user30/user30/user</li>
    </ul>
</div>

{if $msgs->isError()}
    <p></p>
    <div class="alert alert-danger" role="alert">
        <h5>Uwaga!</h5>
        <ul>
        {foreach $msgs->getMessages() as $msg}
        {if $msg->type eq 2}
            <li>{$msg->text}</li>
        {/if}
        {/foreach}
        </ul>
    </div>
{/if}

<!--
----- INFO -----
-->

{if $msgs->isInfo()}
    <p></p>
    <div class="alert alert-success" role="alert">
        <h5>Sukces!</h5>
        <ul>
        {foreach $msgs->getMessages() as $msg}
        {if $msg->type eq 0}
            <li>{$msg->text}</li>
        {/if}
        {/foreach}
        </ul>
    </div>
{/if}
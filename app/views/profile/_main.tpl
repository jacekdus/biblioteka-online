{extends file="main.tpl"}

{block name=extra_buttons}

<div style="padding:10px;" class="navbar-text">
  Zalogowano jako: <b class="text-light">{$user->login}</b>
</div>
<a class="btn btn-danger" href="{$conf->action_root}logout">Wyloguj się</a> 

{/block}

{block name=content}


  <!--
  ----- ACTIVE RESERVATIONS -----
  -->
  {include file="profile/activeReservations.tpl"}


  <!--
  ----- HISTORY -----
  -->
  {include file="profile/historyReservations.tpl"}


{/block}
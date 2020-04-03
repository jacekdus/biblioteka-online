{extends file="main.tpl"}



{block name=extra_options}
{* 
    {if $username eq "admin"}
        <li class="nav-item">
          <a class="nav-link font-weight-bold text-danger" href="{$conf->action_root}add">
            Dodaj wolumin
          </a>
        </li>
    {/if}
 *}
{/block}



{* {block name=extra_buttons}



{/block} *}



{block name=content}

  <!-- 
  ----- NEWS -----
  -->
  {*{include file="catalogue/news.tpl"}*}

  <!--
  ----- SEARCH FORM -----
  -->
  {include file="catalogue/searchForm.tpl"}

  <!--
  ----- CATALOGUE -----
  -->
  {include file="catalogue/catalogue.tpl"}

{/block}
{extends file="main.tpl"}
{block name="content"}
  
  <!-- 
  ----- MESSAGES -----
  -->
  {include file="login/messages.tpl"}


    <div class="row">

    <!-- 
    ----- LOGIN FORM -----
    -->
    {include file="login/loginForm.tpl"}


    <!-- 
    ----- REGISTER FORM -----
    -->
    {include file="login/registerForm.tpl"}
 

    </div>
{/block}
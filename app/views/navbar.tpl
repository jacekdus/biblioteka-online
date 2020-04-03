<nav class="navbar navbar-expand-lg navbar-dark bg-dark border rounded shadow-lg">
    <a class="navbar-brand" href="{$conf->action_root}catalogue">
        biblioteka<span class="navbar-brand mb-0 h1">.online</span>
    </a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">

        <!-- MENU OPTIONS -->
        {if isset($user)}{if $user->role eq 'user'}

            <li class="nav-item">
                <a class="nav-link" href="{$conf->action_root}catalogue">
                    Katalog
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="{$conf->action_root}profile">
                    Karta biblioteczna
                </a>
            </li>

        {/if}{/if}

        </ul>
    </div>

    <!-- USERS INFO + LOGOUT BUTTON -->
    {if isset($user)}

    <div style="padding:10px;" class="navbar-text">
        Zalogowano jako: <b class="text-light">{$user->login}</b>
    </div>
    <a class="btn btn-danger" href="{$conf->action_root}logout">Wyloguj się</a> 

    {/if}

</nav>
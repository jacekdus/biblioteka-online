<div class="col-sm-6">
    <div class="shadow-lg">
        <p></p>
        <div class="card card-body bg-light">
            <h5>Formularz logowania</h5>
            <p>Jeżeli masz już konto w systemie, <a>zaloguj się</a>. <br /></p>
            <form action="{$conf->action_root}login" method="post">
                <div class="form-group row">
                    <label class="col-sm-4 col-form-label" for="InputLogin1">Podaj login</label>
                    <div class="col-sm-8">
                        <input name="login" placeholder="Login" type="text" class="form-control col" id="InputLogin1" {*value="{$form->login}"*}>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-4 col-form-label" for="InputPassword1">Podaj hasło</label>
                    <div class="col-sm-8">
                        <input name="password" placeholder="Hasło" type="password" class="form-control col" id="InputPassword1" {*value="{$form->password}"*}>
                    </div>
                </div>
                <button type="submit" class="btn btn-primary">Zaloguj się</button>
            </form>				    
        </div>
    </div>
</div>
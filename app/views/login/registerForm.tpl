<div class="col-sm-6">
    <div class="shadow-lg">
        <p></p>
        <div class="card card-body bg-light">
            <h5>Formularz rejestracji</h5>
            <p>Jeżeli nie masz jeszcze konta w systemie, <a>zarejestruj się</a>. <br /></p>
            <form action="{$conf->action_root}registerUser" method="post">
                <div class="form-group row">
                    <label class="col-sm-4 col-form-label" for="InputLogin2">Podaj login</label>
                    <div class="col-sm-8">
                        <input name="login" placeholder="Login" type="text" class="form-control col" id="InputLogin2" {*value="{$form->login}"*}>
                    </div>
                </div>
                <div class="form-group row">
                    <label class="col-sm-4 col-form-label" for="InputPassword2">Podaj hasło</label>
                    <div class="col-sm-8">
                        <input name="password" placeholder="Hasło" type="password" class="form-control col" id="InputPassword2" {*value="{$form->password}"*}>
                    </div>
                </div>                  
                <button type="submit" class="btn btn-primary">Zarejestruj się</button>
            </form>	
        </div>
    </div>
</div> 
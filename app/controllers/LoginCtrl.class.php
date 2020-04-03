<?php

namespace app\controllers;

use app\dao\LoginDAO;
use app\model\CredentialsModel;
use core\App;
use core\ParamUtils;
use core\RoleUtils;
use core\SessionUtils;
use core\Utils;

class LoginCtrl
{
    private $credentials;
    
    public function __construct()
    {
        $this->credentials = new CredentialsModel();
    }
    
    public function action_loginPage()
    {
        $this->generate_view();
    }
    
    public function action_login()
    {
        $this->validateLogin();
        if(!App::getMessages()->isError())
        {
            $login = $this->credentials->login;
            $role = $this->credentials->role;
            
            RoleUtils::addRole($role);
            $this->credentials->role = $role;
            
            SessionUtils::storeObject('user', $this->credentials);
            
            switch ($this->credentials->role)
            {
                case 'librarian':
                    App::getRouter()->redirectTo('librarianPage');
                    break;
                default:
                    App::getRouter()->redirectTo('catalogue');
            }
        } 
        else 
        {
            $this->generate_view();
        }
    }
    
    public function action_logout()
    {
        session_destroy();
//         $user = SessionUtils::loadObject('user', TRUE);
//         RoleUtils::removeRole($user->role);
        App::getRouter()->redirectTo(App::getRouter()->getLoginRoute());
    }

    private function validateLogin()
    {
        // Collect data from POST / check if the values are acquired
        $login = $this->credentials->login = ParamUtils::getFromPost('login', true);
        $pass  = $this->credentials->password = ParamUtils::getFromPost('password', true);
        
        // Check if the values are not empty
        if(empty($login)) Utils::addErrorMessage('Login is empty. Please write a correct login');
        if(empty($pass)) Utils::addErrorMessage('Password is empty. Please write a correct password');
        
        // Verify login and password. Acquire role from db if correct
        if(!LoginDAO::credendialsCorrect($this->credentials)) Utils::addErrorMessage('Login and/or password not correct. Please enter correct login and password.');
        else $this->credentials->role = LoginDAO::getUserRole($login);
    }
    
    private function generate_view()
    {
        App::getSmarty()->display('login/_main.tpl');
    }
}

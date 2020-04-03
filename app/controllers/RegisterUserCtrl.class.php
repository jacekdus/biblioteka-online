<?php

namespace app\controllers;

use app\dao\RegisterUserDAO;
use app\model\CredentialsModel;
use app\roles\Roles;
use core\App;
use core\ParamUtils;
use core\Utils;

class RegisterUserCtrl
{
    private $credentials;

    public function __construct()
    {
        $this->credentials = new CredentialsModel();
        $this->credentials->role = Roles::getUserRole();
    }
    
    public function action_registerUser()
    {    
        // If there're no error messages, then the user will be created
        $this->validateRegister();
        if(!App::getMessages()->isError()) 
        {
            RegisterUserDAO::registerUser($this->credentials);
            Utils::addInfoMessage('Stworzono nowego użytkownika');
        }
        else Utils::addErrorMessage('User was not created');
        
        $this->generate_view();
    }
    
    private function validateRegister()
    {
        // Collect data from POST / check if the values are acquired
        $login = $this->credentials->login = ParamUtils::getFromPost('login', true);
        $pass  = $this->credentials->password = ParamUtils::getFromPost('password', true);
        
        // Check if the values are not empty
        if(empty($login)) Utils::addErrorMessage('Login is empty. Please write a correct login');
        if(empty($pass)) Utils::addErrorMessage('Password is empty. Please write a correct password');
        
        // Check if the username is not taken
        if(RegisterUserDAO::userExist($login)) Utils::addErrorMessage('This username is already taken. Choose another one.');
    }
    
    private function generate_view()
    {
        App::getSmarty()->display('login/_main.tpl');
    }
    
    //
    // UTILITY
    //
    private function printErrorMsgs()
    {
        $msgs = App::getMessages();
        foreach ($msgs->getMessages() as $msg)
        {
            echo $msg->text.'<br>';
        }
    }
    
    private function action_showUsers()
    {
        $users = RegisterUserDAO::getUsers();
        foreach ($users as $user)
        {
            echo $user.'<br>';
        }
    }
}


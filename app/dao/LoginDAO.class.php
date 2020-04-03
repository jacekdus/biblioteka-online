<?php
namespace app\dao;

use core\App;

class LoginDAO extends UserDAO
{
    // Checks if acquired login and password are correct
    public static function credendialsCorrect($credentials)
    {
        $login = $credentials->login;
        $password = $credentials->password;
        $hash = App::getDB()->get('user', 'pass', [
            'login' => $login
        ]);
        
        return password_verify($password, $hash);
    }
}


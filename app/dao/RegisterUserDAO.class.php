<?php

namespace app\dao;

use core\App;

class RegisterUserDAO extends UserDAO
{
    // Registers user (login, hashed password, role)
    public static function registerUser($credentials)
    {
        App::getDB()->insert('user', [
            'login' => $credentials->login,
            'pass' => password_hash($credentials->password, PASSWORD_DEFAULT),
            'role' => $credentials->role
        ]);
    }
}


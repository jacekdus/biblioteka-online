<?php

namespace app\dao;

use core\App;

class UserDAO
{
    public static function userExist($username)
    {
        return App::getDB()->has('user', [
            'login' => $username
        ]);
    }
    
    public static function getUsers()
    {
        return App::getDB()->select('user', 'login');
    }
    
    public static function getUserRole($username)
    {
        return App::getDB()->get('user', 'role', [
            'login' => $username
        ]);
    }
    
    public static function getUserId($username)
    {
        return App::getDB()->get('user', 'id', [
            'login' => $username
        ]);
    }
}
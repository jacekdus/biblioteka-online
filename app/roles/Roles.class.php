<?php

namespace app\roles;

class Roles {

    public static function getUserRole() {return 'user';}
    
    public static function getAdminRole() {return 'admin';}
    
    public static function getLibrarianRole() {return 'librarian';}
    
    public static function getAllRoles()
    {
        return [
            self::getAdminRole(),
            self::getUserRole(),
            self::getLibrarianRole()
        ];
    }
}

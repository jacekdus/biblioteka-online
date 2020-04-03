<?php
namespace app\controllers;

use core\App;
use app\roles\Roles;
use app\dao\UserDAO;
use core\SessionUtils;

class MainCtrl
{
    public function action_main()
    {
        $user = SessionUtils::loadObject('user', TRUE);
        switch ($user->role)
        {
            case 'librarian':
                App::getRouter()->redirectTo('librarian');
                break;
            default:
                App::getRouter()->redirectTo('catalogue');
        }
    }
}
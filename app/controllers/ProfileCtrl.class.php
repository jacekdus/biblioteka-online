<?php
namespace app\controllers;

use core\App;
use core\ParamUtils;
use core\SessionUtils;
use app\dao\UserDAO;
use app\dao\ProfileDAO;

class ProfileCtrl
{
    private $user;
    private $reserved;
    private $history;
    
    public function __construct()
    {
        $this->user = SessionUtils::loadObject('user', TRUE);
    }
    
    public function action_profile()
    {
        $idUser = UserDAO::getUserId($this->user->login);
        $this->reserved = ProfileDAO::getReserved($idUser);
        $this->history = ProfileDAO::getHistory($idUser);
        $this->generate_view();
    }
    
    public function action_releaseVolume()
    {
        $reservationId = ParamUtils::getFromPost('id');
        if(ProfileDAO::getReservationStatus($reservationId) != 'received') ProfileDAO::releaseVolume($reservationId);
        App::getRouter()->redirectTo('profile');
    }
    
    private function generate_view()
    {
        App::getSmarty()->assign('reserved', $this->reserved);
        App::getSmarty()->assign('history', $this->history);
        App::getSmarty()->display('profile/_main.tpl');
    }
}


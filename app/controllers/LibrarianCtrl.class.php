<?php
namespace app\controllers;

use core\App;
use app\dao\LibrarianDAO;
use core\ParamUtils;

class LibrarianCtrl
{
    private $reservations;
    
    public function action_librarian()
    {
        $this->reservations = LibrarianDAO::getReservations();
        $this->generate_view();
    }
    
    public function action_changeStatus()
    {
        $reservationStatus = ParamUtils::getFromPost('status');
        $reservationId  = ParamUtils::getFromPost('id');
        
        LibrarianDAO::changeReservationStatus($reservationId, $reservationStatus);
        $this->action_librarian();
    }
    
    private function generate_view()
    {
        App::getSmarty()->assign('reservations', $this->reservations);
        App::getSmarty()->display('librarian/_main.tpl');
    }
}


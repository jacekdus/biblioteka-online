<?php
namespace app\dao;

use core\App;

class LibrarianDAO
{
    public static function getReservations()
    {
        return App::getDB()->select('reservation', [
            '[>]volume' => ['id_volume' => 'id'],
            '[>]reservation_status' => ['id_status' => 'id'],
            '[>]user' => ['id_user' => 'id']
        ],[
            'reservation.id',
            'reservation_status.id(reservation_status_id)',
            'id_volume',
            'author',
            'title',
            'login',
            'start_date',
            'end_date',
            'status_desc'
        ],[
            'ORDER' => ['reservation_status.id' => 'ASC']
        ]);
    }
    
    public static function changeReservationStatus($reservationId, $reservationStatus)
    {
        $id_status = self::getStatusId($reservationStatus);
        
        App::getDB()->update('reservation', [
            'id_status' => $id_status
        ],[
            'id' => $reservationId
        ]);
    }
    
    private static function getStatusId($reservationStatus)
    {
        return App::getDB()->get('reservation_status', 'id', [
            'status_desc' => $reservationStatus
        ]);
    }
}
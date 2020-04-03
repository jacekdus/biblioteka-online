<?php

namespace app\dao;

use core\App;

class ProfileDAO
{
    public static function getReserved($idUser)
    {
        return App::getDB()->select('reservation', [
            '[>]volume' => ['id_volume' => 'id'],
            '[>]reservation_status' => ['id_status' => 'id']
        ],[
            'reservation.id',
            'id_volume',
            'author',
            'title',
            'start_date',
            'end_date',
            'status_desc'
        ],[
            'id_user' => $idUser,
            'status_desc[!]' => 'finished',
            'ORDER' => ['start_date' => 'DESC']
        ]);
    }
    
    public static function getHistory($idUser)
    {
        return App::getDB()->select('reservation', [
            '[>]volume' => ['id_volume' => 'id'],
            '[>]reservation_status' => ['id_status' => 'id']
        ],[
            'id_volume',
            'author',
            'title',
            'start_date',
            'end_date',
            'status_desc'
        ],[
            'id_user' => $idUser,
            'status_desc' => 'finished',
            'ORDER' => ['start_date' => 'DESC']
        ]);
    }
    
    public static function getReservationStatus($reservationId)
    {
        return App::getDB()->get('reservation', 'id_status',[
            'id' => $reservationId
        ]);
    }
    
    public static function releaseVolume($reservationId)
    {
        App::getDB()->update('reservation', [
            'id_status' => self::getStatusId('finished'),
            'end_date' => App::getDB()->raw('CURRENT_TIMESTAMP')
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
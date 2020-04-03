<?php

namespace app\dao;

use core\App;

class CatalogueDAO {
    
    // Zwraca tablice woluminow, obarczona kryteriami wyszukiwania
    public static function getVolumes($form)
    {
        // Utworzenie zmiennej tablicowej dla klauzuli WHERE
        $where_clause = array();
        
        // Wskazanie parametrów do wyszukiwania w klauzuli WHERE
        if($form->author) $where_clause['volume.author[~]'] = $form->author;
        if($form->title) $where_clause['volume.title[~]'] = $form->title;
        if($form->year) $where_clause['volume.year_publication'] = $form->year;
//         if($form->onlyAvailable) $where_clause['volume.status'] = 'available';

        $where_clause["ORDER"] = ["id" => "ASC"];
        
        return App::getDB()->select('volume',[
            'volume.id',
            'author', 
            'title', 
            'year_publication',
        ],
            $where_clause
        );
    }
    
    // Returns volumes 
    public static function getActiveReservations()
    {
        return App::getDB()->select('reservation', [
            '[>]reservation_status' =>  ['id_status' => 'id'],
        ],[
            'id_volume',
            'end_date'
        ],[
            'status_desc[!]' => 'finished',
            'ORDER' => ['reservation.id' => 'DESC']
        ]);
    }
    
    // Returns volumes with reservation status
    public static function getVolumesExtra($form)
    {
        $volumes = self::getVolumes($form);
        $reservedVolumes = self::getActiveReservations();
        
        // Creates temporary array with reserved id's as keys and reservation deadlines as values
        $resIdArray = [];
        foreach ($reservedVolumes as $volume) $resIdArray[$volume['id_volume']] = $volume['end_date'];
        
        // Adds status and reservation deadlines for reserved volumes
        foreach ($volumes as &$volume) if(array_key_exists($volume['id'], $resIdArray)) {
            $volume['status'] = 'reserved';
            $volume['end_date'] = $resIdArray[$volume['id']];
        }
        
        return $volumes;
    }
    
    // Switches reservation status off
    public static function releaseVolume($id)
    {
       App::getDB()->update('reservation',[
           'id_status' => self::getStatusId('finished')
       ],[
           'id_volume' => $id,
           'id_status' => self::getStatusId('reserved')
       ]);
    }
    
    private static function getStatusId($reservationStatus)
    {
        return App::getDB()->get('reservation_status', 'id', [
            'status_desc' => $reservationStatus
        ]);
    }
    
    // Checks if its passed reservation deadline
    public static function reservationDeadlinePassed($idVolume)
    {
        $curr_timestamp = (new \DateTime())->getTimestamp();
        $end_date = App::getDB()->get('reservation', 'end_date',[
            'id_volume' => $idVolume,
            'ORDER' => ['end_date' => 'DESC']
        ]);
        $end_timestamp = (new \DateTime($end_date))->getTimestamp();
        return $curr_timestamp > $end_timestamp;
    }
    
    // Checks if volume is available
    public static function volumeAvailable($idVolume)
    {
        $activeReservations = self::getActiveReservations();
        foreach ($activeReservations as $activeReservation)
        {
            if($activeReservation['id_volume'] == $idVolume) return false;
        }
        return true;
    }
    
    // Returns news
    public static function getNews($limit = 3)
    {
        return App::getDB()->select('news',[
            '[>]user' => ['id_author' => 'id'],
        ],[
            'news.id',
            'title',
            'login',
            'text',
            'date'            
        ],[
            'ORDER' => [
                'id' => 'DESC'
            ],            
            'LIMIT' => $limit
        ]);
    }
    
    // Reserves volume
    public static function reserveVolume($idVolume, $idUser)
    {
        if(self::volumeAvailable($idVolume)){
            App::getDB()->insert("reservation",[
                "id_user" => $idUser,
                "id_volume" => $idVolume,
                "start_date" => App::getDB()->raw("CURRENT_TIMESTAMP"),
                "end_date" => App::getDB()->raw("CURRENT_TIMESTAMP + INTERVAL '30' day"),
                "id_status" => self::getStatusId('reserved')
            ]);            
        }
    }
}

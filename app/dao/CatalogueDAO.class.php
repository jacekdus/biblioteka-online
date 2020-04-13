<?php

namespace app\dao;

use core\App;

class CatalogueDAO {
    
    // Zwraca tablice woluminow, obarczona kryteriami wyszukiwania
    public static function getVolumes($form, $pageNumber)
    {
        // Utworzenie zmiennej tablicowej dla klauzuli WHERE
        $where = self::getWhere($form);
        
        $where_clause = $where[0];
        $where_clause .= " LIMIT :amount OFFSET :offset";
        
        $where_params = $where[1];
        $where_params[':amount'] = $form->amount;
        $where_params[':offset'] = ($pageNumber - 1) * $form->amount;
        
        return App::getDB()->select('volume', [
            '[>]author' => ['id_author' => 'id']
        ],[
            'volume.id',
            'author' => App::getDB()->raw("CONCAT(<first_name>, ' ', <last_name>)"),
            'title', 
            'year_publication',
        ],
            App::getDB()->raw($where_clause, $where_params)
        );
    }
    
    // Returns `where clause` as an array
    public static function getWhere($form)
    {
        // Wskazanie parametrów do wyszukiwania w klauzuli WHERE
        $where_clause = "";
        $where_params = [];
        if($form->author || $form->title || $form->year) $where_clause .= "WHERE";

        $count = 0;
        if($form->author)
        {
            $where_clause .= " CONCAT(<first_name>, ' ', <last_name>) LIKE :likeAuthor";
            $where_params[':likeAuthor'] = "%". $form->author ."%";
            $count++;
        }
        
        if($form->title) 
        {
            if($count > 0) $where_clause .=" AND ";
            $where_clause .= " title LIKE :likeTitle";
            $where_params[':likeTitle'] = "%". $form->title ."%";
            $count++;
        }
        
        if($form->year) 
        {
            if($count > 0) $where_clause .=" AND ";
            $where_clause .= " year_publication LIKE :likeYear";
            $where_params[':likeYear'] = "%". $form->year ."%";
        }

        return [$where_clause, $where_params];
    }
    
    // Returns number of volumes
    public static function countVolumes($form)
    {
        $where = self::getWhere($form);
        $where_clause = $where[0];
        $where_params = $where[1];
        
        return App::getDB()->count('volume', [
            '[>]author' => ['id_author' => 'id']
        ], [
            'volume.id'
        ],
            App::getDB()->raw($where_clause, $where_params)
        );
    }
    
    // Return number of pages of current request
    public static function countPages($form)
    {
        return ceil(self::countVolumes($form)/$form->amount);
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
    public static function getVolumesExtra($form, $pageNumber = 1, $amount = 3)
    {
        $volumes = self::getVolumes($form, $pageNumber, $amount);
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

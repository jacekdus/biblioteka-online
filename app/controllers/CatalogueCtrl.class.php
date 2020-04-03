<?php

namespace app\controllers;

use core\App;
use core\ParamUtils;
use core\Validator;
use app\dao\CatalogueDAO;
use app\dao\LoginDAO;
use app\form\SearchForm;
use core\SessionUtils;

class CatalogueCtrl {
    
    private $volumes;
//     private $news;
    private $searchForm;
    
    public function __construct() 
    {
        $this->searchForm = new SearchForm();
//         $this->news = CatalogueDAO::getNews();
    }
    
    public function action_catalogue() 
    {
        $this->generateView();
    }
    
    public function action_searchVolumes()
    {
        $this->getVolumes();
        $this->generateView();
    }
    
    private function getVolumes()
    {
        // Pobranie danych z formularza
        $v = new Validator();
        $this->searchForm->author = $v->validateFromPost('author');
        $this->searchForm->title = $v->validateFromPost('title');
        $this->searchForm->year = $v->validateFromPost('year');
        
        // Wyszukanie woluminów w bazie razem z danymi dotyczącymi rezerwacji woluminów
        $this->volumes = CatalogueDAO::getVolumesExtra($this->searchForm);
    }
    
    public function action_reserve()
    {
        $user = SessionUtils::loadObject('user', TRUE);
        $idUser = LoginDAO::getUserId($user->login);
        $idVolume = ParamUtils::getFromPost('idVolume');
        
        CatalogueDAO::reserveVolume($idVolume, $idUser);
        
        App::getRouter()->redirectTo(App::getRouter()->getDefaultRoute());
        
    }
    
    public function generateView()
    {
//         App::getSmarty()->assign('news', $this->news);
        App::getSmarty()->assign('searchForm', $this->searchForm);
        App::getSmarty()->assign('volumes', $this->volumes);
        App::getSmarty()->display('catalogue/_main.tpl');
    }
}

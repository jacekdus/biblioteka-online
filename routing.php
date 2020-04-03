<?php

use core\App;
use core\Utils;
use app\roles\Roles;

App::getRouter()->setDefaultRoute('main'); #default action
App::getRouter()->setLoginRoute('loginPage'); #default action if not in role

Utils::addRoute('main',             'mainCtrl',         Roles::getAllRoles());

Utils::addRoute('loginPage',        'LoginCtrl');
Utils::addRoute('login',            'LoginCtrl');
Utils::addRoute('logout',           'LoginCtrl');

Utils::addRoute('registerUser',     'RegisterUserCtrl');

Utils::addRoute('catalogue',        'CatalogueCtrl',    Roles::getUserRole());
Utils::addRoute('searchVolumes',    'CatalogueCtrl',    Roles::getUserRole());
Utils::addRoute('reserve',          'CatalogueCtrl',    Roles::getUserRole());

Utils::addRoute('profile',          'ProfileCtrl',      Roles::getUserRole());
Utils::addRoute('releaseVolume',    'ProfileCtrl',      Roles::getUserRole());

Utils::addRoute('librarian',        'LibrarianCtrl',    Roles::getLibrarianRole());
Utils::addRoute('changeStatus',     'LibrarianCtrl',    Roles::getLibrarianRole());

Utils::addRoute('mail',             'ProfileCtrl',      Roles::getUserRole());

// Utils::addRoute('add', 'CatalogueCtrl', ['admin']);
// Utils::addRoute('add_volume', 'CatalogueCtrl', ['admin']);
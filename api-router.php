<?php
require_once 'tienda-rest/libs/router.php';
require_once 'tienda-rest/app-mvc/controller/api.controller.php';
require_once 'tienda-rest/app-mvc/controller/api.auth.controller.php';

$router = new Router();


// Defino tabla de ruteo
$router->addRoute('product', 'GET', 'ApiController', 'getAllProducts');
$router->addRoute('product/:ID', 'GET', 'ApiController', 'getProduct');
$router->addRoute('product', 'POST', 'ApiController', 'addProduct'); 
$router->addRoute('product/:ID', 'DELETE', 'ApiController', 'deleteProduct');

$router->addRoute('auth/token', 'GET', 'AuthApiController', 'getToken');


// Ejecuta la ruta
$router->route($_GET["resource"], $_SERVER['REQUEST_METHOD']);


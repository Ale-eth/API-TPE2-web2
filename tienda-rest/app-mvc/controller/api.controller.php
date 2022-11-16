<?php

require_once 'tienda-rest/app-mvc/model/api.model.php';
require_once 'tienda-rest/app-mvc/view/api.view.php';
require_once 'tienda-rest/helpers/api.auth.helper.php';


class ApiController{

    private $model;
    private $view;
    private $data;
    private $helper;


    public function __construct() {
        $this->model = new ApiModel();
        $this->view = new ApiView();
        $this->helper = new AuthApiHelper();

        $this->data = file_get_contents("php://input"); // Lee el body del request
    }

    private function getData() {        // Decodifica el JSON del request en un array
        return json_decode($this->data);
    }

    public function getAllProducts($params = null) {
        
        if(!empty($_GET['sort']) && !empty($_GET['column'])){
            $sort = $_GET['sort'];
            $column = $_GET['column'];
            $products = $this->model->getAllProducts($sort, $column);
        }else{
            $products = $this->model->getAllProducts();
        }

        $this->view->response($products, 200);
    }

    public function getProduct($params = null) {
        $id = $params[':ID'];
        $product = $this->model->getProduct($id);

        if ($product) {
            $this->view->response($product);
        } else {
            $this->view->response("El producto con el id=$id no existe", 404);
        }
    }

    public function addProduct($params = null) {
      
        if($this->helper->isLoggedIn()){
            $body = $this->getData();
     
            if(empty($body->nombre) || empty($body->precio) || empty($body->id_categoriaFK) || empty($body->descripcion)){
                $this->view->response("Alguno de los datos esta vacio (nombre, precio, id categoria, descripcion.)");
            }else{
                $product = $this->model->addProduct($body->nombre, $body->precio, $body->id_categoriaFK, $body->descripcion);
                $this->view->response("El producto: $body->nombre fue aniadido.", 201);
            }
        }else{
            $this->view->response("No estas autorizado para aniadir un producto. Por favor ingresa el token de acceso.", 401);
        }
    }

    public function deleteProduct($params = null) {

        if($this->helper->isLoggedIn()){
            $id = $params[':ID'];
            $product = $this->model->getProduct($id);
            if ($product) {
                $this->model->deleteProduct($id);
                $this->view->response("El producto con el id=$id fue eliminado.", 200);
            } else {
                $this->view->response("El producto con el id=$id no existe", 404);
            }
        }else{
            $this->view->response("No estas autorizado para eliminar un producto. Por favor ingresa el token de acceso", 401);
        }

    }
}



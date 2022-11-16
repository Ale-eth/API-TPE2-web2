<?php

class ApiModel{
    private $db;

    public function __construct(){
        // Mac OS
        $this->db = new PDO('mysql:host=localhost;'.'dbname=web2_tiendaderopa;charset=utf8', 'root', 'admin2022');        
    }

    public function getAllProducts($sort = "", $column = "null"){

        if(isset($sort) && isset($column)){
            $query = $this->db->prepare('SELECT * FROM producto ORDER BY '.$column.' '.$sort);
            $query->execute();
            $products = $query->fetchAll(PDO::FETCH_OBJ);
            return $products;
        }else{
            $query = $this->db->prepare('SELECT * FROM producto');
            $query->execute();
            $products = $query->fetchAll(PDO::FETCH_OBJ);
            return $products;
        }
    }

    public function getProduct($id_product){
        $query = $this->db->prepare("SELECT * FROM producto WHERE id_producto = ?");
        $query->execute([$id_product]);

        $product = $query->fetchAll(PDO::FETCH_OBJ);

        if(!empty($product)){
            $idcatprod = $product[0]->id_categoriaFK; // Guardo en una variable la id fk para invocarla en otra llamada, pq sino hay error de tipeo
            $query = $this->db->prepare("SELECT * FROM categoria WHERE id_categoria = ?");
            $query->execute([$idcatprod]);
            $category = $query->fetchAll(PDO::FETCH_OBJ);
    
            $array_product = new ArrayObject(array($product, $category));
            
            return $array_product;
        }


    }

    // API ABM product

    public function formAddProduct(){
        $query = $this->db->prepare("SELECT * FROM categoria");
        $query->execute();

        $categories = $query->fetchAll(PDO::FETCH_OBJ);


        return $categories;
    }

    public function addProduct($nombre, $precio, $id_categoriafk, $descripcion){

        $query = $this->db->prepare("INSERT INTO producto (nombre, precio, id_categoriaFK, descripcion) VALUES (?, ?, ?, ?)");
        $query->execute([$nombre, $precio, $id_categoriafk , $descripcion]);

        return $this->db->lastInsertId();

    }

    public function deleteProduct($id) {
        $query = $this->db->prepare('DELETE FROM producto WHERE id_producto = ?');
        $query->execute([$id]);
    }

} 
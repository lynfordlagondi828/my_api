<?php

/**
 * Created by PhpStorm.
 * User: Lynford
 * Date: 07/03/2019
 * Time: 11:22 AM
 */
class AppFunctions
{
    private $conn;

    function __construct(){

        require_once 'AppConfig.php';
        $database = new AppConfig();

        $this->conn = $database->connect();
    }


    public function get_all_products(){

        $sql = "SELECT * FROM products";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute();
        $result = $stmt->fetchAll();
        return $result;

    }


    /**
     * get product details
     * @param $productId
     * @return array
     */
    public function get_product_details($productId){

        $sql = "SELECT * FROM products WHERE id = ?";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute(array($productId));
        $result = $stmt->fetchAll();
        return $result;
    }

    /**
     * add to cart
     */
    public function add_to_cart($product_id,$name,$price,$description,$image,$sku,$status){

        $sql = "INSERT INTO cart(product_id,name,price,description,image,sku,status)VALUES (?,?,?,?,?,?,?)";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute(array($product_id,$name,$price,$description,$image,$sku,$status));
        $result = $stmt->fetch();
        return $result;

    }

    /**
     * @param $productId
     * @return mixed
     */
    public function check_cart($status){

        $sql = "SELECT * FROM cart WHERE status = 'on_cart'";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute(array($status));
        $result = $stmt->fetch();
        return $result;
    }

    /**
     * get all cart
     */
    public function get_all_cart_products(){

        $sql = "SELECT * FROM cart WHERE status = 'on_cart'";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute();
        $result = $stmt->fetchAll();
        return $result;
    }

    /**
     * Confirm Order
     */
    public function confirm_order($productId,$name,$price,$description,$image,$payment_type,$sku,$status){

        $sql = "INSERT INTO orders(product_id,name,price,description,image,payment_type,sku,status)VALUES (?,?,?,?,?,?,?,?)";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute(array($productId,$name,$price,$description,$image,$payment_type,$sku,$status));
        $result = $stmt->fetch();
        return $result;
    }

    /**
    *Update Cart Status
    */
    public function update_cart_status($product_id,$status){

        $sql = "UPDATE cart set status = ? WHERE product_id = ?";
        $stmt = $this->conn->prepare($sql);
        $stmt->execute(array($status,$product_id));
        $result = $stmt->fetch();
        return $result;
    }


}

















<?php
/**
 * Created by PhpStorm.
 * User: asus
 * Date: 6/27/2016
 * Time: 3:06 PM
 */

ini_set('display_errors',1);
require_once '../libs/Slim/Slim.php';



//\Slim\Slim::registerAutoloader();

\Slim\Slim::registerAutoloader();

$app = new \Slim\Slim();

require_once  "../includes/AppFunctions.php";

function echoResponse($status_code,$response){

    $app = \Slim\Slim::getInstance();

    $app->status($status_code);

    $app->contentType('application/json');
    echo json_encode($response);
}


/**
 * get all agencies
 */
$app->get('/get_all_products', function () use ($app){


    $response = array();

    $database = new AppFunctions();
    $result = $database->get_all_products();

    $response["error"] = FALSE;
    $response["products"] = array();

    foreach($result as $result){

        $tmp = array();


        $tmp["id"] = $result["id"];
        $tmp["name"] = $result["name"];
        $tmp["price"] = $result["price"];
        $tmp["description"] = $result["description"];
        $tmp["image"] = $result["image"];
        $tmp["sku"] = $result["sku"];
        $tmp["created_at"] = $result["created_at"];


        array_push($response["products"],$tmp);
    }

    echoResponse(200,$response);

});

$app->get("/get_product_details/:id", function ($productId){


        $response = array();
        $database = new AppFunctions();
        $result = $database->get_product_details($productId);

        $response["error"] = FALSE;
        $response["products"] = array();

        foreach($result as $result){

            $tmp = array();


            $tmp["id"] = $result["id"];
            $tmp["name"] = $result["name"];
            $tmp["price"] = $result["price"];
            $tmp["description"] = $result["description"];
            $tmp["image"] = $result["image"];
            $tmp["sku"] = $result["sku"];
            $tmp["created_at"] = $result["created_at"];

            array_push($response["products"],$tmp);
        }

        echoResponse(200,$response);
});

$app->post('/add_to_cart/', function() use($app){


            $response = array("error" => FALSE);

            $product_id = $app->request->post('product_id');
            $name = $app->request->post('name');
            $price = $app->request->post('price');
            $description = $app->request->post('description');
            $image   = $app->request->post('image');
            $sku = $app->request->post('sku');
            $status = $app->request->post('status');

            $database = new AppFunctions();

            if($database->check_cart($status)){

                $response["message"] = "Products already in cart";
                echoResponse(200,$response);

            } else {

                $result =  $database->add_to_cart($product_id,$name,$price,$description,$image,$sku,$status);


                if($result != TRUE){

                    $response["error"] =FALSE;
                    $response["message"] = "Products added to cart";
                    echoResponse(200,$response);

                } else {

                    $response["error"] =TRUE;
                    $response["message"] = "Sorry! Something went wrong!!!";
                    echoResponse(200,$response);

                }
            }
});

$app->get('/get_all_cart/', function() use ($app){

            $response = array("error" => FALSE);

            $database = new AppFunctions();

            $result = $database->get_all_cart_products();

            $response["error"] = FALSE;

            $response["cart"] = array();

            foreach($result as $result){

                $tmp = array();

                $tmp["product_id"] = $result["product_id"];
                $tmp["name"] = $result["name"];
                $tmp["price"] = $result["price"];
                $tmp["description"] = $result["description"];
                $tmp["image"] = $result["image"];
                $tmp["sku"] = $result["sku"];
                $tmp["created_at"] = $result["created_at"];
                array_push($response["cart"],$tmp);
            }

            echoResponse(200,$response);


});

/**
 *
 * confirm order
 */
$app->post('/confirm_order/', function() use($app){

            $response = array("error" =>FALSE);

            $product_id = $app->request->post('product_id');
            $name = $app->request->post('name');
            $price = $app->request->post('price');
            $description = $app->request->post('description');
            $image = $app->request->post('image');
            $payment_type = $app->request->post('payment_type');
            $sku = $app->request->post('sku');
            $status = $app->request->post('status');

            $database = new AppFunctions();

            $result = $database->confirm_order($product_id,$name,$price,$description,$image,$payment_type,$sku,$status);

            if($result != TRUE){

                $response["error"] = FALSE;
                $response["message"] = "Order Completed";
                echoResponse(200,$response);

            } else {

                $response["error"] = TRUE;
                $response["message"] = "Order Failed";
                echoResponse(200,$response);

            }
});


$app->post('/update_cart_status/', function() use($app){


                $response = array("error" => FALSE);

                $product_id = $app->request->post('product_id');
                $status = $app->request->post('status');

                $database = new AppFunctions();

                $result = $database->update_cart_status($product_id,$status);

                if($result !=TRUE){

                    $response["error"] = FALSE;
                    $response["message"]= "update success";
                    echoResponse(200,$response);
                } else {

                    $response["error"] = TRUE;
                    $response["message"] = "update failed";
                    echoResponse(200,$response);
                }

});


$app->run();





































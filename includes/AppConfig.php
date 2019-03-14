<?php

/**
 * Created by PhpStorm.
 * User: Lynford
 * Date: 07/03/2019
 * Time: 11:20 AM
 */
class AppConfig
{

    private $coon;

    function __construct(){

    }

    function connect(){

        $this->coon = new PDO("mysql:host=localhost;dbname=api_db","root","");
        return $this->coon;
    }
}

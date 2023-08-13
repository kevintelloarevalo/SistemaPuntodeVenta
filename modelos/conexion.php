<?php

class Conexion{

	static public function conectar(){

		$link = new PDO("mysql:host=localhost:3307;dbname=posmodificado",
			            "root",
			            "root");  //CAMBIAR SEGUN TU LOCALHOST

		$link->exec("set names utf8");

		return $link;

	}

}
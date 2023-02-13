<?php
class ControladorVentas{

/*=============================================
MOSTRAR VENTAS
=============================================*/

static public function ctrMostrarVentas($item, $valor){

    $tabla = "ventas";

    $respuesta = ModeloVentas::mdlMostrarVentas($tabla, $item, $valor);

    return $respuesta;

}



/*=============================================
	CREAR VENTA
=============================================*/

	static public function ctrCrearVenta(){
		if(isset($_POST["nuevaVenta"])){

			/*=============================================
			 REDUCIR EL STOCK 
			=============================================*/

			if($_POST["listaProductos"] == ""){

					echo'<script>

				swal({
					  type: "error",
					  title: "La venta no se ha ejecuta si no hay productos",
					  showConfirmButton: true,
					  confirmButtonText: "Cerrar"
					  }).then(function(result){
								if (result.value) {

								window.location = "ventas";

								}
							})

				</script>';

				return;
			}


			$listaProductos = json_decode($_POST["listaProductos"], true);

			$totalProductosComprados = array();

			foreach ($listaProductos as $key => $value) {

				array_push($totalProductosComprados, $value["cantidad"]);
				 
				$tablaProductos = "productos";
 
				 $item = "idproducto";
				 $valor = $value["id"];
 
				 $traerProducto = ModeloProductos::mdlMostrarProductos($tablaProductos, $item, $valor);
 
				 $item1b = "stock";
				 $valor1b = $value["stock"];
 
				 $nuevoStock = ModeloProductos::mdlActualizarProducto($tablaProductos, $item1b, $valor1b, $valor);
 
			 }

			/*=============================================
			GUARDAR LA COMPRA
			=============================================*/	

			$tabla = "ventas";

			$datos = array("idvendedor"=>$_POST["idVendedor"],
						   "idcliente"=>$_POST["seleccionarCliente"],
						   "codigo"=>$_POST["nuevaVenta"],
						   "cantidadproductos"=>$_POST["listaProductos"],
						   "total"=>$_POST["totalVenta"],
						   "metodo_pago"=>$_POST["listaMetodoPago"]);

			$respuesta = ModeloVentas::mdlIngresarVenta($tabla, $datos);

			if($respuesta == "ok"){
	
				echo'<script>

				swal({
					  type: "success",
					  title: "La venta ha sido guardada correctamente",
					  showConfirmButton: true,
					  confirmButtonText: "Cerrar"
					  }).then(function(result){
								if (result.value) {

								window.location = "ventas";

								}
							})

				</script>';

			}

		}

}



/*=============================================
	EDITAAR VENTA 
=============================================*/

	static public function ctrEditarVenta(){
		
		if(isset($_POST["editarVenta"])){

			/*=============================================
			FORMATEAR TABLA DE PRODUCTOS Y LA DE CLIENTES
			=============================================*/
			$tabla = "ventas";

			$item = "codigo";
			$valor = $_POST["editarVenta"];

			$traerVenta = ModeloVentas::mdlMostrarVentas($tabla, $item, $valor);

			/*=============================================
			REVISAR SI VIENE PRODUCTOS EDITADOS
			=============================================*/

			if($_POST["listaProductos"] == ""){

				$listaProductos = $traerVenta["cantidadproductos"]; // le pasamos el json de Cantidad de productos de esa venta
				$cambioProducto = false;


			}else{

				$listaProductos = $_POST["listaProductos"];
				$cambioProducto = true;
			}

			if($cambioProducto){

				$productos =  json_decode($traerVenta["cantidadproductos"], true);

				$totalProductosComprados = array();

				foreach ($productos as $key => $value) {

					array_push($totalProductosComprados, $value["cantidad"]);
					
					$tablaProductos = "productos";

					$item = "idproducto";
					$valor = $value["id"];

					$traerProducto = ModeloProductos::mdlMostrarProductos($tablaProductos, $item, $valor);


					$item1b = "stock";
					$valor1b = $value["cantidad"] - $traerProducto["stock"];   // AQUI ES CUANDO QUEREMOS DEVOLVER EL STOCK POR EJEMPLO TENEMOS 5 Y SOLO QUISIMOS COMPRAR 4 DEVUELVE EL STOCK DEL PRODUCTO

					$nuevoStock = ModeloProductos::mdlActualizarProducto($tablaProductos, $item1b, $valor1b, $valor);

				}

					$listaProductos_2 = json_decode($listaProductos, true);

					$totalProductosComprados_2 = array();

					foreach ($listaProductos_2 as $key => $value) {

						array_push($totalProductosComprados_2, $value["cantidad"]);  // le pasamos el json de Cantidad de productos de esa venta
						
						$tablaProductos_2 = "productos";

						$item_2 = "idproducto";
						$valor_2 = $value["id"];

						$traerProducto_2 = ModeloProductos::mdlMostrarProductos($tablaProductos_2, $item_2, $valor_2);

						$item1b_2= "stock";
						$valor1b_2 = $value["stock"];

						$nuevoStock = ModeloProductos::mdlActualizarProducto($tablaProductos_2, $item1b_2, $valor1b_2, $valor_2);

					}
				}
					/*=============================================
					EDITAR VENTA
					=============================================*/	

					$datos = array("idvendedor"=>$_POST["idVendedor"],
								"idcliente"=>$_POST["seleccionarCliente"],
								"codigo"=>$_POST["editarVenta"],
								"cantidadproductos"=>$listaProductos,
								"total"=>$_POST["totalVenta"],
								"metodo_pago"=>$_POST["listaMetodoPago"]);

					$respuesta = ModeloVentas::mdlEditarVenta($tabla, $datos);

						if($respuesta == "ok"){

							echo'<script>

							localStorage.removeItem("rango");

							swal({
								type: "success",
								title: "La venta ha sido editada correctamente",
								showConfirmButton: true,
								confirmButtonText: "Cerrar"
								}).then((result) => {
											if (result.value) {

											window.location = "ventas";

											}
										})

							</script>';

						}

		}
	}


	/*=============================================
	ELIMINAR VENTA
	=============================================*/

	static public function ctrEliminarVenta(){

			if(isset($_GET["idVenta"])){

				$tabla = "ventas";

				$item = "id";
				$valor = $_GET["idVenta"];

				$traerVenta = ModeloVentas::mdlMostrarVentas($tabla, $item, $valor);

				$itemVentas = null;
				$valorVentas = null;

				$traerVentas = ModeloVentas::mdlMostrarVentas($tabla, $itemVentas, $valorVentas);

				/*=============================================
				FORMATEAR TABLA DE PRODUCTOS 
				=============================================*/

				$productos =  json_decode($traerVenta["cantidadproductos"], true);  // le pasamos el json de Cantidad de productos de esa venta

				$totalProductosComprados = array();

				foreach ($productos as $key => $value) {

					array_push($totalProductosComprados, $value["cantidad"]);
					
					$tablaProductos = "productos";

					$item = "idproducto";
					$valor = $value["id"];

					$traerProducto = ModeloProductos::mdlMostrarProductos($tablaProductos, $item, $valor);

					$item1b = "stock";
					$valor1b = $value["cantidad"] + $traerProducto["stock"];

					$nuevoStock = ModeloProductos::mdlActualizarProducto($tablaProductos, $item1b, $valor1b, $valor);

				}

				/*=============================================
				ELIMINAR VENTA
				=============================================*/

				$respuesta = ModeloVentas::mdlEliminarVenta($tabla, $_GET["idVenta"]);

				if($respuesta == "ok"){

					echo'<script>

					swal({
						type: "success",
						title: "La venta ha sido borrada correctamente",
						showConfirmButton: true,
						confirmButtonText: "Cerrar",
						closeOnConfirm: false
						}).then((result) => {
									if (result.value) {

									window.location = "ventas";

									}
								})

					</script>';

				}		
			}

	}

	/*=============================================
	RANGO FECHAS
	=============================================*/	

	static public function ctrRangoFechasVentas($fechaInicial, $fechaFinal){

		$tabla = "ventas";

		$respuesta = ModeloVentas::mdlRangoFechasVentas($tabla, $fechaInicial, $fechaFinal);

		return $respuesta;
		
	}
	
	/*=============================================
		SUMA TOTAL VENTAS
	=============================================*/

	static public function ctrSumaTotalVentas(){

			$tabla = "ventas";

			$respuesta = ModeloVentas::mdlSumaTotalVentas($tabla);

			return $respuesta;

		}

}

<div class="login-logo">

<img src="vistas/img/plantilla/acazi.ico" class="img-responsive" style ="">

</div>
<div class="login-wrap">
	<div class="login-html">
		<input id="tab-1" type="radio" name="tab" class="sign-in" checked><label for="tab-1" class="tab">Iniciar Sesión</label>
		<input id="tab-2" type="radio" name="tab" class="sign-up"><label for="tab-2" class="tab"></label>
		<div class="login-form">
			<div class="sign-in-htm">
			<form class="needs-validation" method="post" novalidate>
				<div class="group has-feedback">
					<label class="label">Correo</label>
					<input name="ingUsuario" type="email" class="input" placeholder="Ingresa el Correo" require>		
				</div>
				<div class="group has-feedback">
					<label class="label">Contraseña</label>
					<input name="ingPassword" type="password" class="input" placeholder="Ingresa la Contraseña" require>				
				</div>
				<br>
				<div class="group">
					<button href="paneladministrativo.php"type="submit" class="button">Ingresar</button>
				</div>
				<div class="hr"></div>
			
				<?php

				$login = new ControladorUsuarios();   /* creamos un objeto */
				$login -> ctrIngresoUsuario(); /* instaciamos el metodo ingresoUsuario de la clase */

				?>
			</form>
			</div>
		</div>
	</div>
</div>

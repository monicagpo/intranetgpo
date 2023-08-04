<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link type="text/css" rel="shortcut icon" href="img/logo-mywebsite-urian-viera.svg"/>
  <title>Eliminar - Actualizar Registro con Ventana Modal en PHP :: WebDeveloper Urian Viera</title>
  <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
  <link rel="stylesheet" type="text/css" href="css/cargando.css">
  <link rel="stylesheet" type="text/css" href="css/maquinawrite.css">
  <style> 
        table tr th{
            background:rgba(0, 0, 0, .6);
            color: azure;
        }
        tbody tr{
          font-size: 12px !important;

        }
        h3{
            color:crimson; 
            margin-top: 100px;
        }
        a:hover{
            cursor: pointer;
            color: #333 !important;
        }
      </style>


</head>
<body>
  
<div class="cargando">
    <div class="loader-outter"></div>
    <div class="loader-inner"></div>
</div>

<nav class="navbar navbar-expand-lg navbar-light navbar-dark fixed-top" style="background-color: #563d7c !important;">
    <ul class="navbar-nav mr-auto collapse navbar-collapse">
      <li class="nav-item active">
        <a href="index.php"> 
          <img src="img/logo-mywebsite-urian-viera.svg" alt="Web Developer Urian Viera" width="120">
        </a>
      </li>
    </ul>
    <div class="my-2 my-lg-0" id="maquinaescribir">
      <h5 class="navbar-brand">Web Developer Urian Viera <span>&#160;</span></h5>
    </div>
</nav>



<div class="container mt-5 p-5">

<?php

include('config.php');

////////////////////// BOTON BUSCAR //////////////////////////////////////
$where="where tipo_documentos.id_tipo=1";



if (isset($_POST['buscar']))
{

	
	if (empty($_POST['xsubgrupo']))
	{
		$where="where nombre_documento like '".$_POST['xnombre_documento']."%' or nombre_tipo like '".$_POST['xnombre_documento']."%' or nombre_subgrupo like '".$_POST['xnombre_documento']."%'";
	}

	else if (empty($_POST['xnombre_documento']))
	{
		$where="where nombre_subgrupo='".$_POST['xsubgrupo']."'";
	}

	else
	{
		$where="where nombre like '".$_POST['xnombre']."%' and nombre_subgrupo='".$_POST['xsubgrupo']."' ";
	}
}
///////////////////////////consulta

$documento  = ("SELECT id, nombre_documento,nombre_tipo,nombre_subgrupo,descripcion,ruta FROM tipo_documentos 
			INNER JOIN documentos ON tipo_documentos.id_tipo=documentos.id_tipo 
			INNER JOIN subgrupo_documentos ON documentos.id_subgrupo=subgrupo_documentos.id_subgrupo
			$where ");

$resSubgrupo="SELECT id,nombre_documento,nombre_tipo,nombre_subgrupo,descripcion,ruta FROM tipo_documentos 
			INNER JOIN documentos ON tipo_documentos.id_tipo=documentos.id_tipo 
			INNER JOIN subgrupo_documentos ON documentos.id_subgrupo=subgrupo_documentos.id_subgrupo
			$where group by nombre_subgrupo ";

$resDocumentos = mysqli_query($con, $documento);
$resSubgrupos = mysqli_query($con, $resSubgrupo);


$cantidad     = mysqli_num_rows($resDocumentos);
?>


  <h4 class="text-center">
    Como Eliminar & Actualizar Registro con Ventana Modal en PHP
  </h4>
  <hr>


<div class="row text-center" style="background-color: #cecece">
  <div class="col-md-6"> 
    <strong>Registrar Nuevo Cliente</strong>
  </div>
  <div class="col-md-6"> 
    <strong>Lista de Clientes <span style="color: crimson">  ( <?php echo $cantidad; ?> )</span> </strong>
  </div>
</div>

<section>
			<form method="post">
				<input type="text" placeholder="Nombre" name="xnombre_documento"/>
				<select name="xsubgrupo">
					<option value="">Todos </option>
					<?php

						while ($registroSubgrupo = $resSubgrupos->fetch_array(MYSQLI_BOTH))
						{
							echo '<option value="'.$registroSubgrupo['nombre_subgrupo'].'">'.$registroSubgrupo['nombre_subgrupo'].'</option>';
						}
					?>

				</select>
		
				
				<button name="buscar" type="submit">Buscar</button>
			</form>
            </section>
         

          <div class="col-sm-7">
              <div class="row">
                <div class="col-md-12 p-2">


                <div class="table-responsive">
                    <table class="table table-bordered table-striped table-hover">
                        <thead>
                          <tr>
                            <th scope="col">Nombre</th>
                            <th scope="col">Email</th>
                            <th scope="col">Celular</th>
                            <th scope="col">Acción</th>
                          </tr>
                        </thead>
                        <tbody>
                          <?php
                              while ($registroDocumentos = mysqli_fetch_array($resDocumentos)) { ?>
                          <tr>
                            <td><?php echo $registroDocumentos['nombre_documento']; ?></td>
                            <td><?php echo $registroDocumentos['nombre_tipo']; ?></td>
                            <td><?php echo $registroDocumentos['nombre_subgrupo']; ?></td>
                            
                          <td> 
                             
                            
                              <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#editChildresn<?php echo $registroDocumentos['id']; ?>">
                                  Modificar
                              </button>
                          </td>
                          </tr>
                     

                          
                            <?php  include('ModalEditar.php'); ?>

                           
                           


                        <?php } ?>
                
                    </table>
                </div>


              </div>
          </div>
          </div>
      </div>
  </div>
</div>



</div>


<script src="js/jquery.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>

<script type="text/javascript">
    $(document).ready(function() {

        $(window).load(function() {
            $(".cargando").fadeOut(1000);
        });

//Ocultar mensaje
    setTimeout(function () {
        $("#contenMsjs").fadeOut(1000);
    }, 3000);



    $('.btnBorrar').click(function(e){
        e.preventDefault();
        var id = $(this).attr("id");

        var dataString = 'id='+ id;
        url = "recib_Delete.php";
            $.ajax({
                type: "POST",
                url: url,
                data: dataString,
                success: function(data)
                {
                  window.location.href="index.php";
                  $('#respuesta').html(data);
                }
            });
    return false;

    });


});
</script>

</body>
</html>
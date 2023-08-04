<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link type="text/css" rel="shortcut icon" href="img/logo-mywebsite-urian-viera.svg"/>
  <title>intranet</title>
  <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
  <link rel="stylesheet" type="text/css" href="css/cargando.css">
  <link rel="stylesheet" type="text/css" href="css/maquinawrite.css">
  <link rel="stylesheet" href="css/estilos.css">
  <!--tablax-->
   <link rel="stylesheet" href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css">
    <!--tablax fin -->
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
<!--navegacion
<nav class="navbar navbar-expand-lg navbar-light navbar-dark fixed-top" style="background-color: #563d7c !important;">
    <ul class="navbar-nav mr-auto collapse navbar-collapse">
      <li class="nav-item active">
        <a href="index.php"> 
          <img src="img/logo-mywebsite-urian-viera.svg" alt="Grupo canteras peninsulares" width="120">
        </a>
      </li>
    </ul>
    <div class="my-2 my-lg-0" id="maquinaescribir">
      <h5 class="navbar-brand">Grupo canteras peninsulares <span>&#160;</span></h5>
    </div>
</nav>
<!--navegacion-->
<!--menu-->
 <nav class="navbar navbar-expand-lg navbar-light navbar-dark fixed-top" style="background-color: #563d7c !important";>
            <a href="#" class="enlace">
                <img src="img/Logo_Canteras_small.png" alt="" class="logo">
            </a>
            <input type="checkbox" id="check">
            <label for="check" class="checkbtn">
                <i class="fas fa-bars"></i>
            </label>
            <ul>
                <li><a class="active" href="extensiones.php">Extensiones</a></li>
                <li><a href="ma_administrativos.php">Manuales administrativos</a></li>
                <li><a href="#">Manuales TI</a></li>
                <li><a href="#">Procedimientos</a></li>
                <li><a href="#">Formatos</a></li>
				<li><a href="#">Politicas</a></li>
				<li><a href="#">Tutoriales</a></li>
				<li><a href="#">Sugerencias</a></li>
            </ul>
        </nav>

<!--menu fin-->


<div class="container mt-5 p-5">

<?php

include('config.php');

////////////////////// if para lo enviado en el where ///////////////
$where="";



if (isset($_POST['buscar']))
{

	
	if (empty($_POST['xdepartamento']))
	{
		$where="where nombre like '".$_POST['xnombre']."%' or ext like '".$_POST['xnombre']."%' or depto like '".$_POST['xnombre']."%'";
	}

	else if (empty($_POST['xnombre']))
	{
		$where="where depto='".$_POST['xdepartamento']."'";
	}

	else
	{
		$where="where nombre like '".$_POST['xnombre']."%' and depto='".$_POST['xdepartamento']."'";
	}
}
///////////////////////////consulta

$empleados  = ("SELECT * FROM empleados $where");

$resDepartamento="SELECT * FROM empleados $where group by depto ";

$resEmpleados = mysqli_query($con, $empleados);
$resDepartamentos = mysqli_query($con, $resDepartamento);


$cantidad     = mysqli_num_rows($resEmpleados);
?>

<br> 



  <h4 class="text-center">
    Manuales administrativos
  </h4>
  <hr>

<div class="row text-center" style="background-color: #cecece">
 

  <div class="col-md-12">
    <strong>manuales <span style="color: crimson">  ( <?php echo $cantidad; ?> )</span> </strong>
  </div>

</div>
        <div id="busqueda">
			<form method="post">
				<input type="text" id="input1" placeholder="Nombre" name="xnombre"/>
				<select  id="select1" name="xdepartamento">
					<option value="">Todos </option>
					<?php

						while ($registroDepartamento = $resDepartamentos->fetch_array(MYSQLI_BOTH))
						{
							echo '<option value="'.$registroDepartamento['depto'].'">'.$registroDepartamento['depto'].'</option>';
						}
					?>

				</select>
		
				
				<button name="buscar" type="submit"  id="boton1" >Buscar</button>
			</form>
            </div>

         

          <div class="col-sm-12">
              <div class="row">
                <div class="col-md-12 p-2">


               
                 <table id="tablax" class="table table-striped table-bordered" style="width:100%">
                    
                        <thead>
                          <tr>
                             <th scope="col">Nombre</th>
                            <th scope="col">Extension</th>
                            <th scope="col">Departamento</th>
                            <th scope="col">Comentarios</th>
                          </tr>
                        </thead>
                        <tbody>
                          <?php
                              while ($registroEmpleados = mysqli_fetch_array($resEmpleados)) { ?>
                          <tr>
                            <td><?php echo $registroEmpleados['nombre']; ?></td>
                            <td><?php echo $registroEmpleados['ext']; ?></td>
                            <td><?php echo $registroEmpleados['depto']; ?></td>
                            <td><?php echo $registroEmpleados['comentarios']; ?></td>
                          
                          </tr>
                     

                          
                            

                           
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
<!-- DATATABLES -->
    <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js">
    </script>
    <!-- BOOTSTRAP -->
    <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js">
    </script>
    <script>
    ////////////////CAMBIO DE IDIOMA DataTable y DESABILITACION DE INPUT SEARCH////////////////////////////
        $(document).ready(function () {
            $('#tablax').DataTable({
                 
                language: {
                    processing: "Tratamiento en curso...",
                    search: "Buscar&nbsp;:",
                    lengthMenu: "Agrupar de _MENU_ items" ,
                    info: "Mostrando del item _START_ al _END_ de un total de _TOTAL_ items",
                    infoEmpty: "No existen datos.",
                    infoFiltered: "(filtrado de _MAX_ elementos en total)",
                    infoPostFix: "",
                    loadingRecords: "Cargando...",
                    zeroRecords: "No se encontraron datos con tu busqueda",
                    emptyTable: "No hay datos disponibles en la tabla.",
                    paginate: {
                        first: "Primero",
                        previous: "Anterior",
                        next: "Siguiente",
                        last: "Ultimo"
                    },
                    aria: {
                        sortAscending: ": active para ordenar la columna en orden ascendente",
                        sortDescending: ": active para ordenar la columna en orden descendente"
                    }
                },
                scrollY: 400,
                lengthMenu: [ [10, 20, -1], [10, 20, "All"] ],
                "searching": false,
                
                
               
            });
        });
    </script>
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
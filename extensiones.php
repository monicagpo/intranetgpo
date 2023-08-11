<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link type="text/css" rel="shortcut icon" href="img/logo-mywebsite-urian-viera.svg"/>
        <title>intranet</title>
                                             <!--inicio Estilos -->
  <link rel="stylesheet" type="text/css" href="css/bootstrap.css">       <!--Estilo BOOTSTRAP-->
  <link rel="stylesheet" type="text/css" href="css/maquinawrite.css">
  <link rel="stylesheet" type="text/css" href="css/style_menu.css">      <!--Estilo menu de navegación-->
  <link rel="stylesheet" type="text/css" href="css/estilo_tabla.css">    <!--Estilo tabla-->
                                              <!--fin Estilos -->
                                                 <!--tablax-->
  <link rel="stylesheet" href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css">

</head>
<body>
  


<!--navegacion-->
<!--menu-->
<header class="header">
     <div class="container">
        <div class="header-main">
           
           <div class="open-nav-menu">
              <span></span>
           </div>
           <div class="menu-overlay">
           </div>
           <!-- inicio del menu -->
           <nav class="nav-menu navbar navbar-expand-md  fixed-top"  style="background-color: #563d7c !important;">
           <div class="logo">
               <img  src="img/Logo_Canteras_small.png" >
           </div>
             <div class="close-nav-menu">
                <img src="img/close.svg" alt="close">
             </div>
             <ul class="menu">
             <li class="menu-item">
                   <a href="extensiones.php">Extensiones</a>
                </li>
                <li class="menu-item menu-item-has-children">
                   <a href="#" data-toggle="sub-menu">Manuales<i class="plus"></i></a>
                   <ul class="sub-menu">
                       <li class="menu-item"><a href="ma_administrativos.php">Manuales administrativos</a></li>
                       <li class="menu-item"><a href="#">Manuales TI</a></li>
                       
                   </ul>
                </li>
                
                <li class="menu-item">
                   <a href="#">Procedimientos</a>
                </li>
                <li class="menu-item">
                   <a href="#">Formatos</a>
                </li>
                <li class="menu-item">
                   <a href="#">Politicas</a>
                </li>
                <li class="menu-item">
                   <a href="#">Tutoriales</a>
                </li>
                <li class="menu-item">
                   <a href="#">Sugerencias</a>
                </li>
               
             </ul>
           </nav>
           <!-- fin del menu-->
        </div>
     </div>
  </header>

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
		$where="where nombre like '%".$_POST['xnombre']."%' or ext like '".$_POST['xnombre']."%' or depto like '".$_POST['xnombre']."%' or comentarios like '".$_POST['xnombre']."%'";
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
    Extensiones
  </h4>
  <hr>

<div class="row text-center" style="background-color: #cecece">
 

  <div class="col-md-12">
    <strong>extensiones <span style="color: crimson">  ( <?php echo $cantidad; ?> )</span> </strong>
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
                        
                          <?php
                              while ($registroEmpleados = mysqli_fetch_array($resEmpleados)) { 
                          ?>
                          <tr>
                            <td><?php echo $registroEmpleados['nombre']; ?></td>
                            <td><?php echo $registroEmpleados['ext']; ?></td>
                            <td><?php echo $registroEmpleados['depto']; ?></td>
                            <td><?php echo $registroEmpleados['comentarios']; ?></td>
                          
                          </tr>
                  
                        <?php } 
                        ?>
                
                  </table>
                </div>
              </div>
          </div>
          

                                                    <!-- inicio Scripts-->
     <script src="js/jquery.min.js"></script>
     <script src="js/popper.min.js"></script>
     <script src="js/bootstrap.min.js"></script>
     <script src="js/script.js"></script> <!--Script de menu de navegacion-->
     <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script><!-- DATATABLES -->
     <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script> <!-- BOOTSTRAP -->
     <script src="js/jstablax.js"></script> <!--Script  tabla-->

                                                    <!--fin Scripts-->


</body>
</html>
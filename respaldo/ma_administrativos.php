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
  
  <link rel="stylesheet" type="text/css" href="css/style_menu.css">
  <link rel="stylesheet" type="text/css" href="css/estilo_archivo.css">
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
              <a href="extensiones.php">Extensiones</a>
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
                <li class="menu-item">
                   <a href="#">Reglamento</a>
                </li>
               
             </ul>
           </nav>
           <!-- fin del menu-->
        </div>
     </div>
  </header>



<div class="container mt-5 p-5">

<?php

include('config.php');

////////////////////// if para lo enviado en el where ///////////////
$where="where tipo_documentos.id_tipo=1";




if (isset($_POST['buscar']))

{
	if (empty($_POST['xsubgrupo']))
	{
		
        $where="where nombre_documento like '%".$_POST['xnombre_documento']."%' or nombre_tipo like '%".$_POST['xnombre_documento']."%' or nombre_subgrupo like '%".$_POST['xnombre_documento']."%' or descripcion like '%".$_POST['xnombre_documento']."%' ";
	}

	else if (empty($_POST['xnombre_documento']))
	{
		$where="where nombre_subgrupo='".$_POST['xsubgrupo']."'";
        
	}

	else  
	{
		$where="where nombre like '%".$_POST['xnombre']."%' and nombre_subgrupo='%".$_POST['xsubgrupo']."%' ";
	}
}


///////////////////////////consulta

$documento  = ("SELECT id, nombre_documento,nombre_tipo,nombre_subgrupo,descripcion,ruta FROM tipo_documentos 
			INNER JOIN documentos ON tipo_documentos.id_tipo=documentos.id_tipo 
			INNER JOIN subgrupo_documentos ON documentos.id_subgrupo=subgrupo_documentos.id_subgrupo
			$where and tipo_documentos.id_tipo=1 ");

$resSubgrupo="SELECT id,nombre_documento,nombre_tipo,nombre_subgrupo,descripcion,ruta FROM tipo_documentos 
			INNER JOIN documentos ON tipo_documentos.id_tipo=documentos.id_tipo 
			INNER JOIN subgrupo_documentos ON documentos.id_subgrupo=subgrupo_documentos.id_subgrupo
			where tipo_documentos.id_tipo=1 group by nombre_subgrupo ";

$resDocumentos = mysqli_query($con, $documento);
$resSubgrupos = mysqli_query($con, $resSubgrupo);


$cantidad     = mysqli_num_rows($resDocumentos);
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
				<input type="text" id="input1" placeholder="Nombre" name="xnombre_documento"/>
				<select  id="select1" name="xsubgrupo">
					<option  disabled>Todos </option>
					<?php

						while ($registroSubgrupo = $resSubgrupos->fetch_array(MYSQLI_BOTH))
						{
							echo '<option value="'.$registroSubgrupo['nombre_subgrupo'].'">'.$registroSubgrupo['nombre_subgrupo'].'</option>';
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
                            <th scope="col">Tipo</th>
                            <th scope="col">Subrupo</th>
                            <th scope="col">Archivo</th>
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
                             
                            
                              <button type="button" id="boton1" data-toggle="modal" data-target="#editChildresn<?php echo $registroDocumentos['id']; ?>">
                                  Ver
                              </button>
                          </td>
                          </tr>
                     

                          
                            <?php  include('archivo.php'); ?>
                            

                           
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
    <script src="js/script.js"></script> <!--Script de menu de navegacion-->
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


</body>
</html>
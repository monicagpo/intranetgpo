   <?php

    include('config.php');
	include('ma_administrativos.php');

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


    $cantidad = mysqli_num_rows($resDocumentos);
    ?>
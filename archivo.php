
<div class="modal fade" id="editChildresn<?php echo $registroDocumentos['id']; ?>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"   >
  <div class="modal-dialog"  >
   <div class="modal-content" >
        <!DOCTYPE html>
            <html>
            

            <body>
                <div class="titulo_archivo" > 
                 
                <br>
                       <?php echo $registroDocumentos['nombre_documento']; ?>
                    
                </div>
                <div  style=" height: 25px; background-color: #cecece;border:0px; text-align: right; " >
                  <a href="manuales/<?php echo $registroDocumentos['ruta']; ?>#toolbar=0">
                    <button  style="background-color:#cecece; border:0px;"><img src="img/flechas.png"/></button>
                 </a>  
                </div> 

                 <div class="frame_archivo">
                   <embed  src="manuales/<?php echo $registroDocumentos['ruta']; ?>#toolbar=0"style="border: 1px solid black; width: 100%; height: 500px; float: left;"</embed>
                  <!-- <iframe  src="manuales/<?php echo $registroDocumentos['ruta']; ?>" scrolling="no" style="border: 1px solid black; width: 100%; height: 500px; float: left;" ></iframe>-->
                 </div>

                  <div class="pie_archivo">
                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                  </div> 
            </body>
        </html>
   </div>
  </div>
</div>
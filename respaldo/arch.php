
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
     
                 <div class="frame_archivo">
                   <iframe  src="manuales/<?php echo $registroDocumentos['ruta']; ?>" style="border: 1px solid black; width: 100%; height: 500px; float: left;" ></iframe>
                 </div>

                  <div class="pie_archivo">
                  <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
                  </div> 
            </body>
        </html>
   </div>
  </div>
</div>








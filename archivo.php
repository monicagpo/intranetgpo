
<div class="modal fade" id="editChildresn<?php echo $registroDocumentos['id']; ?>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content" style= "width:900px  !important;height:700px !important; "  >
      <div class="modal-header" style="background-color: #563d7c !important;">
        <h6 class="modal-title" style="color: #fff; text-align: center;">
            <?php echo $registroDocumentos['nombre_documento']; ?>
        </h6>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>


      <div >
        <input type="hidden" name="id" value="<?php echo $registroDocumentos['id']; ?>">

            <div class="modal-body" id="cont_modal">

                <div class="form-group">
                  
                  <iframe style= "width:800px;height:500px !important; " src="manuales/<?php echo $registroDocumentos['ruta']; ?>"  ></iframe>
                </div>
                
                
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
              
            </div>
       </div>

    </div>
  </div>
</div>
<!---fin ventana Update --->

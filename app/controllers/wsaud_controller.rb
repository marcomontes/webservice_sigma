class WsaudController < ApplicationController

  protect_from_forgery :except => :respuesta_inscripcion_audiencia
  #skip_before_filter :verify_authenticity_token


  def recibir_datos_audiencia_publica
    
  end

  def respuesta_inscripcion_audiencia
    id_audiencia_publica = params[:id_audiencia_publica]
    #ria = VitalAdapter.respuesta_inscripcion_audiencia(id_audiencia_publica)
    #@ria = {
#      :id_inscrito => ria.IdInscrito,
#      :nombre_inscrito => ria.NombreInscrito,
#      :cedula_inscrito => ria.CedulaInscrito,
#      :lugar_expedicion => ria.LugarExpedicion,
#      :correo_inscrito => ria.CorreoInscrito,
#      :aprobado_inscrito => ria.AprobadoInscrito,
#      :motivo => ria.Motivo
#    }
    @ria = {:metodo => "Respuesta Inscripcion Audiencia"}

    respond_to do |format|
      format.xml  { render :xml => @ria }
    end
  end

  def aprueba_inscripcion_audiencia

  end

  def datos_inscripcion_audiencia
    
  end

  def inscripcion_audiencia_aa
    
  end

end

class WsaudController < ApplicationController

  def recibir_datos_audiencia_publica
    
  end

  def respuesta_inscripcion_audiencia
    id_audiencia_publica = params[:id_audiencia_publica]
    ria = VitalAdapter.respuesta_inscripcion_audiencia(id_audiencia_publica)
    ria.IdInscrito
    ria.NombreInscrito
    ria.CedulaInscrito
    ria.LugarExpedicion
    ria.CorreoInscrito
    ria.AprobadoInscrito
    ria.Motivo
  end

  def aprueba_inscripcion_audiencia

  end

  def datos_inscripcion_audiencia
    
  end

  def inscripcion_audiencia_aa
    
  end

end

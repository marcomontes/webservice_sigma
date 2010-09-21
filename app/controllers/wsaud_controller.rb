class WsaudController < ApplicationController

  protect_from_forgery :except => :respuesta_inscripcion_audiencia
  #skip_before_filter :verify_authenticity_token


   # Recibe la información de una Autoridad Ambiental para la celebración de una Audiencia Pública
  def recibir_datos_audiencia_publica
    #  Número Silpa de la Solicitud de Audiencia Pública
    numero_silpa = params[:numero_silpa]
    #  Fecha de Expedición del Edicto
    #  Identificación del Solicitante
    #  Lista con la Identificación de las entidades y de la comunidad del municipio donde se pretende desarrollar la audiencia pública ambiental
    #  Nombre del proyecto, Obra o Actividad
    #  Número de expediente
    #  Identificación de la persona natural o jurídica interesada en la licencia o permiso ambiental.
    #  Fecha de celebración de la audiencia pública.
    #  Lugar de celebración de la audiencia pública.
    #  Lista de Lugar(es) donde se podrá realizar la inscripción de ponentes.
    #  Lista de Lugar(es) donde estarán disponibles los estudios ambientales para ser consultados.
    #  Fecha de realización de la reunión informativa
    #  Lugar de realización de la reunión informativa
    #  Convocatoria a quienes deseen asistir y/o intervenir como ponentes.
    #  Edicto Adjunto
    #  Id de la Autoridad Ambiental
    
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

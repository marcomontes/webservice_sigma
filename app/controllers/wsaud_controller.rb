class WsaudController < ApplicationController

  # Recibe la información de una Autoridad Ambiental para la celebración de una Audiencia Pública
  def recibir_datos_audiencia_publica
    numero_silpa = params[:numero_silpa]
    fecha_expedicion = params[:fecha_expedicion]
    id_solicitante = params[:id_solicitante]
    ids_entidades = params[:ids_entidades]
    nombre_proyecto = params[:nombre_proyecto]
    numero_expediente = params[:numero_expediente]
    id_persona_interesada = params[:id_persona_interesada]
    fecha_audiencia_publica = params[:fecha_audiencia_publica]
    lugar_audiencia_publica = params[:lugar_audiencia_publica]
    lugares_inscripcion = params[:lugares_inscripcion]
    lugares_consulta = params[:lugares_consulta]
    fecha_reunion = params[:fecha_reunion]
    lugar_reunion = params[:lugar_reunion]
    convocatoria_ponentes = params[:convocatoria_ponentes]
    edicto_adjunto = params[:edicto_adjunto]
    id_autoridad_ambiental = params[:id_autoridad_ambiental]

    sql = ""
    method = get_method_name
    sql_result = Corpocaldas.query(sql)
    send_file(method, sql_result)
  end

  # Recibe la información de una Autoridad Ambiental con la respuesta a la inscripción de Audiencia Pública
  def respuesta_inscripcion_audiencia
    sql = ""
    method = get_method_name
    sql_result = Corpocaldas.query(sql)
    send_file(method, sql_result)
  end

  def aprueba_inscripcion_audiencia
    sql = ""
    method = get_method_name
    sql_result = Corpocaldas.query(sql)
    send_file(method, sql_result)
  end

  def datos_inscripcion_audiencia
    sql = ""
    method = get_method_name
    sql_result = Corpocaldas.query(sql)
    send_file(method, sql_result)
  end

  def inscripcion_audiencia_aa
    sql = ""
    method = get_method_name
    sql_result = Corpocaldas.query(sql)
    send_file(method, sql_result)
  end

  protected

#    def create_response
#      VitalAdapter.new_client('WSAUD')
#    end

    def get_service
      "wsaud"
    end

    def get_method_name
      caller[0]=~/`(.*?)'/
      $1
    end

    def send_file(method, response)
      output = VitalAdapter.output_type
      if output == 'download'
        file_name = "#{get_service}-#{method}.xml"
        VitalAdapter.generate_file(file_name, response)
        send_file "#{RAILS_ROOT}/tmp/#{file_name}" , :filename => "#{file_name}"
      elsif output == 'xml'
        respond_to do |format| format.xml  { render :xml => response } end
      end
    end

end

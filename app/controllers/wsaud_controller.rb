class WsaudController < ApplicationController

  # Recibe la información de una Autoridad Ambiental para la celebración de una Audiencia Pública
  def recibir_datos_audiencia_publica
    method = get_method_name
    vital = VitalAdapter.get_fields(get_service, method)
    sql = ""
    sql_result = Corpocaldas.query(sql)
    send_file(method, sql_result)
  end

  # Recibe la información de una Autoridad Ambiental con la respuesta a la inscripción de Audiencia Pública
  def respuesta_inscripcion_audiencia
    method = get_method_name
    vital = VitalAdapter.get_fields(get_service, method)
    sql = ""
    sql_result = Corpocaldas.query(sql)
    send_file(method, sql_result)
  end

  def aprueba_inscripcion_audiencia
    method = get_method_name
    vital = VitalAdapter.get_fields(get_service, method)
    sql = ""
    sql_result = Corpocaldas.query(sql)
    send_file(method, sql_result)
  end

  def datos_inscripcion_audiencia
    method = get_method_name
    vital = VitalAdapter.get_fields(get_service, method)
    sql = ""
    sql_result = Corpocaldas.query(sql)
    send_file(method, sql_result)
  end

  def inscripcion_audiencia_aa
    method = get_method_name
    vital = VitalAdapter.get_fields(get_service, method)
    sql = ""
    sql_result = Corpocaldas.query(sql)
    send_file(method, sql_result)
  end

  protected

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

class WsaudController < ApplicationController

  # Recibe la información de una Autoridad Ambiental para la celebración de una Audiencia Pública
  def recibir_datos_audiencia_publica
    method = get_method_name
    response = create_response
    soap_body = VitalAdapter.soap_body(get_service, method)
    response.recibir_datos_audiencia_publica{ |soap| soap.body = "{ #{soap_body} }" }
    send_file(method, response)
  end

  # Recibe la información de una Autoridad Ambiental con la respuesta a la inscripción de Audiencia Pública
  def respuesta_inscripcion_audiencia
    method = get_method_name
    response = create_response
    soap_body = VitalAdapter.soap_body(get_service, method)
    response.recibir_datos_audiencia_publica{ |soap| soap.body = "{ #{soap_body} }" }
    send_file(method, response)
  end

  def aprueba_inscripcion_audiencia
    method = get_method_name
    response = create_response
    soap_body = VitalAdapter.soap_body(get_service, method)
    response.recibir_datos_audiencia_publica{ |soap| soap.body = "{ #{soap_body} }" }
    send_file(method, response)
  end

  def datos_inscripcion_audiencia
    method = get_method_name
    response = create_response
    soap_body = VitalAdapter.soap_body(get_service, method)
    response.recibir_datos_audiencia_publica{ |soap| soap.body = "{ #{soap_body} }" }
    send_file(method, response)
  end

  def inscripcion_audiencia_aa
    method = get_method_name
    response = create_response
    soap_body = VitalAdapter.soap_body(get_service, method)
    response.recibir_datos_audiencia_publica{ |soap| soap.body = "{ #{soap_body} }" }
    send_file(method, response)
  end

  protected

    def create_response
      VitalAdapter.new_client('WSAUD')
    end

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

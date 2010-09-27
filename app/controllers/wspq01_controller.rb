class Wspq01Controller < ApplicationController

  def recibir_publicacion
    method = get_method_name
    response = create_response
    soap_body = VitalAdapter.soap_body(get_service, method)
    response.recibir_datos_audiencia_publica{ |soap| soap.body = "{ #{soap_body} }" }
    send_file(method, response)
  end

  def recibir_fijacion
    method = get_method_name
    response = create_response
    soap_body = VitalAdapter.soap_body(get_service, method)
    response.recibir_datos_audiencia_publica{ |soap| soap.body = "{ #{soap_body} }" }
    send_file(method, response)
  end

  def aclarar_pubicacion
    method = get_method_name
    response = create_response
    soap_body = VitalAdapter.soap_body(get_service, method)
    response.recibir_datos_audiencia_publica{ |soap| soap.body = "{ #{soap_body} }" }
    send_file(method, response)
  end

  def aclarar_fijacion
    method = get_method_name
    response = create_response
    soap_body = VitalAdapter.soap_body(get_service, method)
    response.recibir_datos_audiencia_publica{ |soap| soap.body = "{ #{soap_body} }" }
    send_file(method, response)
  end

  def eliminar_publicacion_fijacion
    method = get_method_name
    response = create_response
    soap_body = VitalAdapter.soap_body(get_service, method)
    response.recibir_datos_audiencia_publica{ |soap| soap.body = "{ #{soap_body} }" }
    send_file(method, response)
  end

  protected

    def create_response
      VitalAdapter.new_client('WSPQ01')
    end

    def get_service
      "wspq01"
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

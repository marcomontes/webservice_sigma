class Wspq03Controller < ApplicationController

  def recibir_documento
    response = create_response
    soap_body = VitalAdapter.soap_body("#{get_service}", 'recibir_documento')

    response.recibir_documento{
      |soap| soap.body = "{ #{soap_body} }"
    }

    respond_to do |format|
      format.xml  { render :xml => response }
    end
  end

  def emitir_documento
    response = create_response
    soap_body = VitalAdapter.soap_body("#{get_service}", 'emitir_documento')

    response.emitir_documento{
      |soap| soap.body = "{ #{soap_body} }"
    }

    respond_to do |format|
      format.xml  { render :xml => response }
    end
  end

  def obtener_datos_adjuntos
    response = create_response
    soap_body = VitalAdapter.soap_body("#{get_service}", 'obtener_datos_adjuntos')

    response.obtener_datos_adjuntos{
      |soap| soap.body = "{ #{soap_body} }"
    }

    respond_to do |format|
      format.xml  { render :xml => response }
    end
  end

  def enviar_datos_radicacion
    response = create_response
    soap_body = VitalAdapter.soap_body("#{get_service}", 'enviar_datos_radicacion')

    response.enviar_datos_radicacion{
      |soap| soap.body = "{ #{soap_body} }"
    }

    respond_to do |format|
      format.xml  { render :xml => response }
    end
  end

  protected

    def create_response
      VitalAdapter.new_client('WSPQ03')
    end

    def get_service
      "wspq03"
    end

end

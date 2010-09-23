class Wspq02Controller < ApplicationController

  def enviar_comunicacion
    response = create_response
    soap_body = VitalAdapter.soap_body("#{get_service}", 'enviar_comunicacion')

    response.enviar_comunicacion{
      |soap| soap.body = "{ #{soap_body} }"
    }

    respond_to do |format|
      format.xml  { render :xml => response }
    end
  end

  def enviar_comunicacion_visita
    response = create_response
    soap_body = VitalAdapter.soap_body("#{get_service}", 'enviar_comunicacion_visita')

    response.enviar_comunicacion_visita{
      |soap| soap.body = "{ #{soap_body} }"
    }

    respond_to do |format|
      format.xml  { render :xml => response }
    end
  end

  def monitorear_respuesta_ee
    response = create_response
    soap_body = VitalAdapter.soap_body("#{get_service}", 'monitorear_respuesta_ee')

    response.monitorear_respuesta_ee{
      |soap| soap.body = "{ #{soap_body} }"
    }

    respond_to do |format|
      format.xml  { render :xml => response }
    end
  end

  protected

    def create_response
      VitalAdapter.new_client('WSPQ02')
    end

    def get_service
      "wspq02"
    end

end

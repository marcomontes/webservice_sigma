class WsnotController < ApplicationController

  def actualizar_estado_notificacion
    response = create_response
    soap_body = VitalAdapter.soap_body("#{get_service}", 'actualizar_estado_notificacion')

    response.actualizar_estado_notificacion{
      |soap| soap.body = "{ #{soap_body} }"
    }

    respond_to do |format|
      format.xml  { render :xml => response }
    end
  end

  def verificar_estado_notificacion
    response = create_response
    soap_body = VitalAdapter.soap_body("#{get_service}", 'actualizar_estado_notificacion')

    response.actualizar_estado_notificacion{
      |soap| soap.body = "{ #{soap_body} }"
    }

    respond_to do |format|
      format.xml  { render :xml => response }
    end
  end

  protected

    def create_response
      VitalAdapter.new_client('WSNOT')
    end

    def get_service
      "wsnot"
    end
  
end

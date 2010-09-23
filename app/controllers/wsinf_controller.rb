class WsinfController < ApplicationController

  def recibir_informacion_ee
    response = create_response
    soap_body = VitalAdapter.soap_body("#{get_service}", 'recibir_informacion_ee')

    response.recibir_informacion_ee{
      |soap| soap.body = "{ #{soap_body} }"
    }

    respond_to do |format|
      format.xml  { render :xml => response }
    end
  end

  protected

    def create_response
      VitalAdapter.new_client('WSINF')
    end

    def get_service
      "wsinf"
    end
 
end

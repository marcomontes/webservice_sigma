class WssanController < ApplicationController

  def respuesta_queja_denuncia
    response = create_response
    soap_body = VitalAdapter.soap_body("#{get_service}", 'respuesta_queja_denuncia')

    response.respuesta_queja_denuncia{
      |soap| soap.body = "{ #{soap_body} }"
    }

    respond_to do |format|
      format.xml  { render :xml => response }
    end
  end

  protected

    def create_response
      VitalAdapter.new_client('WSSAN')
    end

    def get_service
      "wssan"
    end
 
end

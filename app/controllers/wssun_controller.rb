class WssunController < ApplicationController

  def recibir_datos_salvoconducto
    response = create_response
    soap_body = VitalAdapter.soap_body("#{get_service}", 'recibir_datos_salvoconducto')

    response.recibir_datos_salvoconducto{
      |soap| soap.body = "{ #{soap_body} }"
    }

    respond_to do |format|
      format.xml  { render :xml => response }
    end
  end

  protected

    def create_response
      VitalAdapter.new_client('WSSUN')
    end

    def get_service
      "wssun"
    end

end

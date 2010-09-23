class Wsces02Controller < ApplicationController

  def cambiar_cesionario
    response = create_response
    soap_body = VitalAdapter.soap_body("#{get_service}", 'cambiar_cesionario')

    response.cambiar_cesionario{
      |soap| soap.body = "{ #{soap_body} }"
    }

    respond_to do |format|
      format.xml  { render :xml => response }
    end
  end

  protected

    def create_response
      VitalAdapter.new_client('WSCES02')
    end

    def get_service
      "wsces02"
    end
  
end

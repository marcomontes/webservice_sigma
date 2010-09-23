class Wspq04Controller < ApplicationController

  def recibir_datos_cobro
    response = create_response
    soap_body = VitalAdapter.soap_body("#{get_service}", 'recibir_datos_cobro')

    response.recibir_datos_cobro{
      |soap| soap.body = "{ #{soap_body} }"
    }

    respond_to do |format|
      format.xml  { render :xml => response }
    end
  end

  def enviar_datos_pago
    response = create_response
    soap_body = VitalAdapter.soap_body("#{get_service}", 'recibir_datos_cobro')

    response.recibir_datos_cobro{
      |soap| soap.body = "{ #{soap_body} }"
    }

    respond_to do |format|
      format.xml  { render :xml => response }
    end
  end

  def monitorear_pago
    response = create_response
    soap_body = VitalAdapter.soap_body("#{get_service}", 'recibir_datos_cobro')

    response.recibir_datos_cobro{
      |soap| soap.body = "{ #{soap_body} }"
    }

    respond_to do |format|
      format.xml  { render :xml => response }
    end
  end

  protected

    def create_response
      VitalAdapter.new_client('WSPQ04')
    end

    def get_service
      "wspq04"
    end


end

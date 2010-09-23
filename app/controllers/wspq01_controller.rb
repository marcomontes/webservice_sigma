class Wspq01Controller < ApplicationController

  def recibir_publicacion
    response = create_response
    soap_body = VitalAdapter.soap_body("#{get_service}", 'recibir_publicacion')

    response.recibir_publicacion{
      |soap| soap.body = "{ #{soap_body} }"
    }

    respond_to do |format|
      format.xml  { render :xml => response }
    end
  end

  def recibir_fijacion
    response = create_response
    soap_body = VitalAdapter.soap_body("#{get_service}", 'recibir_fijacion')

    response.recibir_fijacion{
      |soap| soap.body = "{ #{soap_body} }"
    }

    respond_to do |format|
      format.xml  { render :xml => response }
    end
  end

  def aclarar_pubicacion
    response = create_response
    soap_body = VitalAdapter.soap_body("#{get_service}", 'aclarar_pubicacion')

    response.aclarar_pubicacion{
      |soap| soap.body = "{ #{soap_body} }"
    }

    respond_to do |format|
      format.xml  { render :xml => response }
    end
  end

  def aclarar_fijacion
    response = create_response
    soap_body = VitalAdapter.soap_body("#{get_service}", 'aclarar_fijacion')

    response.aclarar_fijacion{
      |soap| soap.body = "{ #{soap_body} }"
    }

    respond_to do |format|
      format.xml  { render :xml => response }
    end
  end

  def eliminar_publicacion_fijacion
    response = create_response
    soap_body = VitalAdapter.soap_body("#{get_service}", 'eliminar_publicacion_fijacion')

    response.eliminar_publicacion_fijacion{
      |soap| soap.body = "{ #{soap_body} }"
    }

    respond_to do |format|
      format.xml  { render :xml => response }
    end
  end

  protected

    def create_response
      VitalAdapter.new_client('WSPQ01')
    end

    def get_service
      "wspq01"
    end

end

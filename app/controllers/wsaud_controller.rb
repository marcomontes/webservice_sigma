class WsaudController < ApplicationController

  # Recibe la información de una Autoridad Ambiental para la celebración de una Audiencia Pública
  def recibir_datos_audiencia_publica
    response = create_response
    soap_body = VitalAdapter.soap_body("#{get_service}", 'recibir_datos_audiencia_publica')

    response.recibir_datos_audiencia_publica{
      |soap| soap.body = "{ #{soap_body} }"
    }

    respond_to do |format|
      format.xml  { render :xml => response }
    end
  end

  # Recibe la información de una Autoridad Ambiental con la respuesta a la inscripción de Audiencia Pública
  def respuesta_inscripcion_audiencia
    response = create_response
    soap_body = VitalAdapter.soap_body("#{get_service}", 'respuesta_inscripcion_audiencia')

    response.respuesta_inscripcion_audiencia{
      |soap| soap.body = "{ #{soap_body} }"
    }

    respond_to do |format|
      format.xml  { render :xml => response }
    end
  end

  def aprueba_inscripcion_audiencia
    response = create_response
    soap_body = VitalAdapter.soap_body("#{get_service}", 'aprueba_inscripcion_audiencia')

    response.aprueba_inscripcion_audiencia{
      |soap| soap.body = "{ #{soap_body} }"
    }

    respond_to do |format|
      format.xml  { render :xml => response }
    end
  end

  # SILPA expone los datos de inscripción para intervenir en una audiencia pública
  def datos_inscripcion_audiencia
    response = create_response
    soap_body = VitalAdapter.soap_body("#{get_service}", 'datos_inscripcion_audiencia')

    response.datos_inscripcion_audiencia{
      |soap| soap.body = "{ #{soap_body} }"
    }

    respond_to do |format|
      format.xml  { render :xml => response }
    end
  end

  # Recibe la información de inscripción para intervenir en una audiencia pública
  def inscripcion_audiencia_aa
    response = create_response
    soap_body = VitalAdapter.soap_body("#{get_service}", 'inscripcion_audiencia_aa')

    response.recibir_datos_audiencia_publica{
      |soap| soap.body = "{ #{soap_body} }"
    }

    respond_to do |format|
      format.xml  { render :xml => response }
    end
  end

  protected

    def create_response
      VitalAdapter.new_client('WSAUD')
    end

    def get_service
      "wsaud"
    end

end

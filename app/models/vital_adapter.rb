class VitalAdapter

  include HTTParty
  #base_uri 'vital.com'
  default_params :output => 'xml'
  format :xml
  
  WS_URL = "http://webservicevital.com"

  # WSAUD

  def self.respuesta_inscripcion_audiencia(id_audiencia_publica)
    get("#{WS_URL}/WSAUD/RespuestaInscripcionAudiencia")
  end
  
end

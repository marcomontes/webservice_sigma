class VitalAdapter

  include HTTParty
  #base_uri 'vital.com'
  default_params :output => 'xml'
  format :xml
  
  WS_URL = "http://webservicevital.com"

  # WSAUD

  def self.respuesta_inscripcion_audiencia
    "#{WS_URL}"
  end
  
end

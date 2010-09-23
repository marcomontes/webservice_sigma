class VitalAdapter
  
  WS_CONFIG = YAML::load(ERB.new(File.read("#{RAILS_ROOT}/config/webservice.yml")).result)[RAILS_ENV]
  VITAL_FIELDS = YAML::load(ERB.new(File.read("#{RAILS_ROOT}/config/vital.yml")).result)

  WSDL = WS_CONFIG['wsdl_root']

  def self.new_client(service)
    Savon::Client.new "#{WSDL}#{service}.xml"
  end

  def self.get_actions(service)
    client = new_client(service)
    client.wsdl.soap_actions
  end

#  def self.create_response(service, method)
#    soap_body = soap_body("#{service}", "#{method}")
#    response = new_client("#{service}")
#    response.method{
#      |soap| soap.body = "{ #{soap_body} }"
#    }
#  end

  def self.soap_body(service, method)
    fields = VITAL_FIELDS["#{service}"]["#{method}"]
    soap_body = String.new
    fields.each do |f|
      soap_body << ":#{f} => params[:#{f}]"
      soap_body << ", " if f != fields.last
    end
    soap_body
  end

end

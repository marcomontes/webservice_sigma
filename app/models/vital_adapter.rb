class VitalAdapter
  
  WS_CONFIG = YAML::load(ERB.new(File.read("#{RAILS_ROOT}/config/webservice.yml")).result)[RAILS_ENV]
  WSDL = WS_CONFIG['wsdl_root']

  def self.new_client(service)
    Savon::Client.new "#{WSDL}#{service}.xml"
  end

  def self.get_actions(service)
    client = new_client(service)
    client.wsdl.soap_actions
  end

end

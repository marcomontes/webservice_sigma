class VitalAdapter
  
  WS_CONFIG = YAML::load(ERB.new(File.read("#{RAILS_ROOT}/config/webservice.yml")).result)
  VITAL_FIELDS = YAML::load(ERB.new(File.read("#{RAILS_ROOT}/config/vital.yml")).result)

  WSDL = WS_CONFIG['wsdl_root']

  def self.new_client(service)
    Savon::Client.new "#{WSDL}#{service}.xml"
  end

  def self.get_actions(service)
    client = new_client(service)
    client.wsdl.soap_actions
  end

  def self.soap_body(service, method)
    fields = VITAL_FIELDS["#{service}"]["#{method}"]
    soap_body = String.new
    fields.each do |f|
      soap_body << ":#{f} => params[:#{f}]"
      soap_body << ", " if f != fields.last
    end
    soap_body
  end

  def self.generate_file(file_name, response)
    temp_file = File.new("#{RAILS_ROOT}/tmp/#{file_name}", "w")
    File.open("#{RAILS_ROOT}/tmp/#{file_name}", "w") do |file|
      xml = response.to_xml
      file.write(xml)
    end
  end

  def self.output_type
    if WS_CONFIG['output']['download'] == true
      'download'
    elsif WS_CONFIG['output']['xml'] == true
      'xml'
    else
      'xml'
    end
  end

end

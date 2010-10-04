class VitalAdapter

  WS_CONFIG = YAML::load(ERB.new(File.read("#{RAILS_ROOT}/config/webservice.yml")).result)
  VITAL_FIELDS = YAML::load(ERB.new(File.read("#{RAILS_ROOT}/config/vital.yml")).result)

  WSDL = WS_CONFIG['wsdl_root']

  class << self

    def get_actions(service)
      client = new_client(service)
      client.wsdl.soap_actions
    end

    def get_fields(service, method)
      fields = VITAL_FIELDS["#{service}"]["#{method}"]
      parameters = {}
      fields.each do |f|
        parameters.merge!(f => "params[:#{f}]")
      end
      parameters
    end

    def generate_file(file_name, response)
      temp_file = File.new("#{RAILS_ROOT}/tmp/#{file_name}", "w")
      File.open("#{RAILS_ROOT}/tmp/#{file_name}", "w") do |file|
        xml = response.to_xml
        file.write(xml)
      end
    end

    def output_type
      if WS_CONFIG['output']['download'] == true
        'download'
      elsif WS_CONFIG['output']['xml'] == true
        'xml'
      else
        'xml'
      end
    end

  end

end

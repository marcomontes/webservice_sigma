class WssanController < ApplicationController

  def respuesta_queja_denuncia
    sql = ""
    method = get_method_name
    sql_result = Corpocaldas.query(sql)
    send_file(method, sql_result)
  end

  protected

    def create_response
      VitalAdapter.new_client('WSSAN')
    end

    def get_service
      "wssan"
    end

    def get_method_name
      caller[0]=~/`(.*?)'/
      $1
    end

    def send_file(method, response)
      output = VitalAdapter.output_type
      if output == 'download'
        file_name = "#{get_service}-#{method}.xml"
        VitalAdapter.generate_file(file_name, response)
        send_file "#{RAILS_ROOT}/tmp/#{file_name}" , :filename => "#{file_name}"
      elsif output == 'xml'
        respond_to do |format| format.xml  { render :xml => response } end
      end
    end
 
end

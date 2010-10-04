class WssunController < ApplicationController

  def recibir_datos_salvoconducto
    method = get_method_name
    vital = VitalAdapter.get_fields(get_service, method)
    sql = ""
    sql_result = Corpocaldas.query(sql)
    send_file(method, sql_result)
  end

  protected

    def get_service
      "wssun"
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

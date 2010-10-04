class Wspq04Controller < ApplicationController

  def recibir_datos_cobro
    sql = ""
    method = get_method_name
    sql_result = Corpocaldas.query(sql)
    send_file(method, sql_result)
  end

  def enviar_datos_pago
    sql = ""
    method = get_method_name
    sql_result = Corpocaldas.query(sql)
    send_file(method, sql_result)
  end

  def monitorear_pago
    sql = ""
    method = get_method_name
    sql_result = Corpocaldas.query(sql)
    send_file(method, sql_result)
  end

  protected

#    def create_response
#      VitalAdapter.new_client('WSPQ04')
#    end

    def get_service
      "wspq04"
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

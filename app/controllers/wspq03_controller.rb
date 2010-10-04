class Wspq03Controller < ApplicationController

  def recibir_documento
    sql = ""
    method = get_method_name
    sql_result = Corpocaldas.query(sql)
    send_file(method, sql_result)
  end

  def emitir_documento
    sql = ""
    method = get_method_name
    sql_result = Corpocaldas.query(sql)
    send_file(method, sql_result)
  end

  def obtener_datos_adjuntos
    sql = ""
    method = get_method_name
    sql_result = Corpocaldas.query(sql)
    send_file(method, sql_result)
  end

  def enviar_datos_radicacion
    sql = ""
    method = get_method_name
    sql_result = Corpocaldas.query(sql)
    send_file(method, sql_result)
  end

  protected

#    def create_response
#      VitalAdapter.new_client('WSPQ03')
#    end

    def get_service
      "wspq03"
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

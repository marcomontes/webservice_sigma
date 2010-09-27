class CorpocaldasController < ApplicationController

  def consulta
    fields = params[:campos]
    tables = params[:tablas]
    conditions = params[:condiciones]

    sql = "SELECT #{fields} FROM #{tables} WHERE #{conditions}"
    sql_result = Corpocaldas.find_by_sql(sql)

    output = VitalAdapter.output_type

    if output == 'download'
      file_name = "corpocaldas_query.xml"
      VitalAdapter.generate_file(file_name, sql_result)
      send_file "#{RAILS_ROOT}/tmp/#{file_name}" , :filename => "#{file_name}"
    elsif output == 'xml'
      respond_to do |format| format.xml  { render :xml => sql_result } end
    end

  end

end
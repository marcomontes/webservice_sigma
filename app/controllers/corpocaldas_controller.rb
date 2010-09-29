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

  def listar_tramites
    id_tramite = params[:id_tramite]

    sql = "select
          per_codigo as Id_Tramite,
          per_tipo as Tipo_Proceso,
          t_permiso.usu_identi as Id_Solicitante,
          (usu_nombre||' '||validar_null(usu_priape)||' '||validar_null(usu_segape)) as Solicitante
          from t_permiso, t_usuari
          where t_permiso.per_codigo = '#{id_tramite}'
          and t_permiso.usu_identi = t_usuari.usu_identi"

    sql_result = Corpocaldas.find_by_sql(sql)

    output = VitalAdapter.output_type

    if output == 'download'
      file_name = "listar_tramites.xml"
      VitalAdapter.generate_file(file_name, sql_result)
      send_file "#{RAILS_ROOT}/tmp/#{file_name}" , :filename => "#{file_name}"
    elsif output == 'xml'
      respond_to do |format| format.xml  { render :xml => sql_result } end
    end
  end

  def verificar_estado_notificacion
    numero_expediente = params[:n_expediente]
    numero_acto_administrativo = params[:n_acto_admin]

    sql = "select t_permiso.per_codigo as Id_Tramite, 
          res_numero as Num_Acto_Advo,
          res_fecha as Fecha_Acto_Advo,
          t_permiso.usu_identi as Id_Solicitante,
          usu_tipide as Tipo_Id,
          usu_tipo as Tipo_Persona,
          (usu_nombre||' '||validar_null(usu_priape)||' '||validar_null(usu_segape)) as Solicitante
          from t_permiso, t_usuari, t_resolu
          where t_permiso.per_codigo = '#{numero_expediente}' --ejemplo
          and res_numero = '#{numero_acto_administrativo}' -- ejemplo
          and t_permiso.usu_identi = t_usuari.usu_identi
          and t_permiso.per_codigo = t_resolu.per_codigo"

    sql_result = Corpocaldas.find_by_sql(sql)

    output = VitalAdapter.output_type

    if output == 'download'
      file_name = "estado_notificacion.xml"
      VitalAdapter.generate_file(file_name, sql_result)
      send_file "#{RAILS_ROOT}/tmp/#{file_name}" , :filename => "#{file_name}"
    elsif output == 'xml'
      respond_to do |format| format.xml  { render :xml => sql_result } end
    end
  end

  def obtener_datos_solicitud
    id_autoridada_ambiental = params[:id_autoridad_ambiental]
    id_persona = [:id_persona]
    id_estado_solicitud = [:id_estado_solicitud]

    sql = "select usu_identi as Id_Persona, 
          (usu_nombre||' '||validar_null(usu_priape)||' '||validar_null(usu_segape)) as Solicitante,
          usu_email as Correo_Electronico,
          usu_telefo as Telefono,
          usu_tipide as Tipo_Id,
          usu_lugexp as Lugar_Exped,
          usu_celular as Celular,
          usu_fax as Fax,
          usu_tarpro as Tarjeta_Pro,
          usu_direcco as Direccion,
          usu_depart as Id_Depto,
          dep_nombre as Nombre_Depto,
          usu_ciudad as Municipio,
          usu_vereda as Vereda
          from t_usuari, t_depart
          where t_usuari.usu_identi = '#{id_persona}'
          and t_usuari.usu_depart = t_depart.dep_codigo"

    sql_result = Corpocaldas.find_by_sql(sql)

    output = VitalAdapter.output_type

    if output == 'download'
      file_name = "datos_solicitud.xml"
      VitalAdapter.generate_file(file_name, sql_result)
      send_file "#{RAILS_ROOT}/tmp/#{file_name}" , :filename => "#{file_name}"
    elsif output == 'xml'
      respond_to do |format| format.xml  { render :xml => sql_result } end
    end

  end

end
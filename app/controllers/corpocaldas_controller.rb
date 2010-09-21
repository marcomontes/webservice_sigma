class CorpocaldasController < ApplicationController

  def consultar
    tabla = params[:tabla]
    campos = params[:campos]
    condicion = params[:condicion]
    sql = "SELECT #{campos} FROM #{tabla} WHERE #{condicion}"
  end

  def insertar

  end

  def test
    @test = Corpocaldas.find_by_sql("select * from test")
    respond_to do |format|
      format.xml  { render :xml => @test }
    end
  end

  def consulta
    codigo = params[:codigo]
    @consulta = Usuario.find_by_sql("select per_codigo as Id_Tramite, per_tipo as Tipo_Proceso, t_permiso.usu_identi as Id_Solicitante,
(usu_nombre||' '||validar_null(usu_priape)||' '||validar_null(usu_segape)) as Solicitante
from t_permiso, t_usuari
where t_permiso.per_codigo = '#{codigo}' --ejemplo
and t_permiso.usu_identi = t_usuari.usu_identi")

    respond_to do |format|

      format.xml  { render :xml => @consulta }
    end

  end
  
end

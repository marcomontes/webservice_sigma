class Intermedia < ActiveRecord::Base
  set_table_name "t_intermedia"
  set_primary_key :int_codigo

  def self.create_record(response)
    record = self.new

    record.int_codigo = response.codigo
    record.int_tipo = nil
    record.int_estado = nil
    record.int_fecreg = nil
    record.int_tipsol = nil
    record.int_nomraz = nil
    record.int_priape = nil
    record.int_segape = nil
    record.int_tipide = nil
    record.int_idesol = nil
    record.int_lugexp = nil
    record.int_direco = nil
    record.int_codeso = nil
    record.int_comuso = nil
    record.int_telefo = nil
    record.int_fax = nil
    record.int_email = nil
    record.int_nomrep = nil
    record.int_tidere = nil
    record.int_iderep = nil
    record.int_dircor = nil
    record.int_codere = nil
    record.int_comure = nil
    record.int_telere = nil
    record.int_faxre = nil
    record.int_emailr = nil
    record.int_nomapo = nil
    record.int_tideap = nil
    record.int_ideapo = nil
    record.int_dircoa = nil
    record.int_codeap = nil
    record.int_comuap = nil
    record.int_teleap = nil
    record.int_faxapo = nil
    record.int_emaila = nil
    record.int_tarpro = nil
    record.int_nompro = nil
    record.int_valpro = nil
    record.int_deppro = nil
    record.int_munpro = nil
    record.int_verpro = nil
    record.int_sector = nil
    record.int_ficcat = nil
    record.int_activi = nil
    record.int_calact = nil
    record.int_numrad = nil
    record.int_fecrad = nil
    record.per_codigo = nil

    record.save
  end
end

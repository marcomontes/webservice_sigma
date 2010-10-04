class Intermedia < ActiveRecord::Base
  set_table_name "t_intermedia"
  set_primary_key :int_codigo
  
  def self.create_record(parameters)
    record = self.new
    
    record.int_codigo = parameters["int_codigo"]
    record.int_tipo =   parameters["int_tipo"]
    record.int_estado = parameters["int_estado"]
    record.int_fecreg = parameters["int_fecreg"]
    record.int_tipsol = parameters["int_tipsol"]
    record.int_nomraz = parameters["int_nomraz"]
    record.int_priape = parameters["int_priape"]
    record.int_segape = parameters["int_segape"]
    record.int_tipide = parameters["int_tipide"]
    record.int_idesol = parameters["int_idesol"]
    record.int_lugexp = parameters["int_lugexp"]
    record.int_direco = parameters["int_direco"]
    record.int_codeso = parameters["int_codeso"]
    record.int_comuso = parameters["int_comuso"]
    record.int_telefo = parameters["int_telefo"]
    record.int_fax =    parameters["int_fax"]
    record.int_email =  parameters["int_email"]
    record.int_nomrep = parameters["int_nomrep"]
    record.int_tidere = parameters["int_tidere"]
    record.int_iderep = parameters["int_iderep"]
    record.int_dircor = parameters["int_dircor"]
    record.int_codere = parameters["int_codere"]
    record.int_comure = parameters["int_comure"]
    record.int_telere = parameters["int_telere"]
    record.int_faxre =  parameters["int_faxre"]
    record.int_emailr = parameters["int_emailr"]
    record.int_nomapo = parameters["int_nomapo"]
    record.int_tideap = parameters["int_tideap"]
    record.int_ideapo = parameters["int_ideapo"]
    record.int_dircoa = parameters["int_dircoa"]
    record.int_codeap = parameters["int_codeap"]
    record.int_comuap = parameters["int_comuap"]
    record.int_teleap = parameters["int_teleap"]
    record.int_faxapo = parameters["int_faxapo"]
    record.int_emaila = parameters["int_emaila"]
    record.int_tarpro = parameters["int_tarpro"]
    record.int_nompro = parameters["int_nompro"]
    record.int_valpro = parameters["int_valpro"]
    record.int_deppro = parameters["int_deppro"]
    record.int_munpro = parameters["int_munpro"]
    record.int_verpro = parameters["int_verpro"]
    record.int_sector = parameters["int_sector"]
    record.int_ficcat = parameters["int_ficcat"]
    record.int_activi = parameters["int_activi"]
    record.int_calact = parameters["int_calact"]
    record.int_numrad = parameters["int_numrad"]
    record.int_fecrad = parameters["int_fecrad"]
    record.per_codigo = parameters["per_codigo"]

    record.save
  end
end
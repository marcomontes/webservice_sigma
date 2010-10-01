class Corpocaldas < ActiveRecord::BaseWithoutTable

  def self.query(sql)
    sql_result = Corpocaldas.find_by_sql(sql)
    sql_result
  end

  def self.custom_query(fields, tables, conditions)
    sql_query = "SELECT #{fields} FROM #{tables} WHERE #{conditions}"
    sql_result = Corpocaldas.find_by_sql(sql_query)
    sql_result
  end
 
end

class Klinika < ApplicationRecord
  include ActiveModel::Validations
  validates :name, presence: true
  validates :adress, presence: true
  has_many :otdelenies
  has_many :card_pacients

  def self.all_by_SQL()
    ActiveRecord::Base.connection.execute("SELECT * FROM klinikas ")
  end

  def self.find_by_id_SQL(id)
    ActiveRecord::Base.connection.execute("SELECT * FROM klinikas WHERE id="+id.to_s)
  end

  def self.find_by_where_SQL(where)
    ActiveRecord::Base.connection.execute("SELECT * FROM klinikas WHERE "+where.to_s)
  end

  def self.edit_by_SQL(mas)
    ActiveRecord::Base.connection.execute("UPDATE klinikas SET name='"+mas["name"]+"', adress='"+mas["adress"]+"' WHERE id="+mas["id"].to_s)
  end

  def self.delete_by_id_SQL(id)
    ActiveRecord::Base.connection.execute("DELETE FROM klinikas WHERE id="+id.to_s)
  end

  def self.delete_by_where_SQL(where)
    ActiveRecord::Base.connection.execute("DELETE FROM klinikas WHERE "+where.to_s)
  end

  def self.find_otdelenies(id)
    ActiveRecord::Base.connection.execute("SELECT * FROM otdelenies WHERE klinika_id="+id.to_s)
  end

  def self.find_card_pacients(id)
    ActiveRecord::Base.connection.execute("SELECT * FROM card_pacients WHERE klinika_id="+id.to_s)
  end

end

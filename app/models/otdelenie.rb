class Otdelenie < ApplicationRecord
  include ActiveModel::Validations
  validates :name, presence: true
  belongs_to :klinika
  has_many :vraches

  def self.all_by_SQL()
    ActiveRecord::Base.connection.execute("SELECT * FROM otdelenies ")
  end

  def self.find_by_id_SQL(id)
    ActiveRecord::Base.connection.execute("SELECT * FROM otdelenies WHERE id=" + id.to_s)[0]
  end

  def self.find_by_where_SQL(where)
    ActiveRecord::Base.connection.execute("SELECT * FROM otdelenies WHERE " + where.to_s)
  end

  def self.edit_by_SQL(mas)
    ActiveRecord::Base.connection.execute("UPDATE otdelenies SET name='"+mas["name"]+"', klinika_id='"+mas["klinika_id"].to_s+"' WHERE id="+mas["id"].to_s)
  end

  def self.find_klinika(id)
    tmp = ActiveRecord::Base.connection.execute("SELECT * FROM otdelenies WHERE id="+id.to_s)[0]
    ActiveRecord::Base.connection.execute("SELECT * FROM klinikas WHERE id="+tmp["klinika_id"].to_s)[0]
  end

  def self.find_vraches(id)
    ActiveRecord::Base.connection.execute("SELECT * FROM vraches WHERE otdelenie_id="+id.to_s)
  end

  def self.delete_by_id_SQL(id)
    ActiveRecord::Base.connection.execute("DELETE FROM otdelenies WHERE id="+id.to_s)
  end

  def self.delete_by_where_SQL(where)
    ActiveRecord::Base.connection.execute("DELETE FROM otdelenies WHERE "+where.to_s)
  end

end

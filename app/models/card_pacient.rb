class CardPacient < ApplicationRecord
  include ActiveModel::Validations
  validates :adress, presence: true
  validates :diagnoz, presence: true
  validates :number, presence: true
  belongs_to :klinika
  has_one :pacient
  belongs_to :vrach
  paginates_per 10

  def self.all_by_SQL()
    ActiveRecord::Base.connection.execute("SELECT * FROM card_pacients ")
  end

  def self.find_by_id_SQL(id)
    ActiveRecord::Base.connection.execute("SELECT * FROM card_pacients WHERE id=" + id.to_s)[0]
  end

  def self.find_by_where_SQL(where)
    ActiveRecord::Base.connection.execute("SELECT * FROM card_pacients WHERE " + where.to_s)
  end

  def self.edit_by_SQL(mas)
    ActiveRecord::Base.connection.execute("UPDATE card_pacients SET adress='"+mas["adress"]+"', diagnoz='"+mas["diagnoz"]+"', klinika_id='"+mas["klinika_id"].to_s+"' WHERE id="+mas["id"].to_s)
  end

  def self.find_klinika(id)
    tmp = ActiveRecord::Base.connection.execute("SELECT * FROM card_pacients WHERE id="+id.to_s)[0]
    ActiveRecord::Base.connection.execute("SELECT * FROM klinikas WHERE id="+tmp["klinika_id"].to_s)[0]
  end

  def self.find_pacient(id)
    ActiveRecord::Base.connection.execute("SELECT * FROM pacients WHERE card_pacient_id="+id.to_s)[0]
  end

  def self.delete_by_id_SQL(id)
    ActiveRecord::Base.connection.execute("DELETE FROM pacients WHERE id="+id.to_s)
  end

  def self.delete_by_where_SQL(where)
    ActiveRecord::Base.connection.execute("DELETE FROM pacients WHERE "+where.to_s)
  end

end

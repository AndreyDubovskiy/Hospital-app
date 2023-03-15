class CardPacient < ApplicationRecord
  include ActiveModel::Validations
  validates :adress, presence: true
  validates :diagnoz, presence: true
  belongs_to :klinika
  has_one :pacient
end

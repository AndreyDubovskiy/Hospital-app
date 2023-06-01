class Pacient < ApplicationRecord
  include ActiveModel::Validations
  validates :name, presence: true
  validates :surname, presence: true
  validates :age, presence: true
  validates :phone, presence: true
  belongs_to :card_pacient
end

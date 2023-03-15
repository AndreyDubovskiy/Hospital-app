class Klinika < ApplicationRecord
  include ActiveModel::Validations
  validates :name, presence: true
  validates :adress, presence: true
  has_many :otdelenies
  has_many :card_pacients
end

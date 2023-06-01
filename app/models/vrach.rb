class Vrach < ApplicationRecord
  include ActiveModel::Validations
  validates :name, presence: true
  validates :surname, presence: true
  validates :age, presence: true
  belongs_to :special
  belongs_to :otdelenie
  has_many :card_pacients
end

class Pacient < ApplicationRecord
  include ActiveModel::Validations
  validates :name, presence: true
  belongs_to :card_pacient
end

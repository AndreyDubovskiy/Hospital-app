class Otdelenie < ApplicationRecord
  include ActiveModel::Validations
  validates :name, presence: true
  belongs_to :klinika
  has_many :vraches
end

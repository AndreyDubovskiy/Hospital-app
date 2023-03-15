class Special < ApplicationRecord
  include ActiveModel::Validations
  validates :name, presence: true
  has_many :vraches
end

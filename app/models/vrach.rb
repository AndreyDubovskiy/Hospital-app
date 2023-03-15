class Vrach < ApplicationRecord
  include ActiveModel::Validations
  validates :name, presence: true
  belongs_to :special
  belongs_to :otdelenie
end

class Spree::Campaign < ActiveRecord::Base
  has_and_belongs_to_many :products

  validates :title, :description, :start_at, :end_at, presence: true
end

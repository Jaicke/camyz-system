class Project < ApplicationRecord
  has_one_attached :cover

  validates_presence_of :order, :name, :description, :cover, :template
  validates_uniqueness_of :order, if: -> { self.order.present? }
  validates :order, numericality: { greater_than: 0 }, if: -> { self.order.present? }
end

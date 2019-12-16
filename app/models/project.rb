class Project < ApplicationRecord
  has_one_attached :cover

  validates_presence_of :order, :name, :description
  validates_uniqueness_of :order, if: -> { self.order.present? }
end

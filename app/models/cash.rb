class Cash < ApplicationRecord
  has_many :moves, dependent: :destroy

  validates :name, presence: true
end

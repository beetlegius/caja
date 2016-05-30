class Move < ApplicationRecord

  KINDS = [IN = 'in', OUT = 'out']

  belongs_to :cash

  validates :kind, :ammount, presence: true
  validates :ammount, numericality: { greater_than: 0 }
  validates :kind, inclusion: { in: KINDS }
end

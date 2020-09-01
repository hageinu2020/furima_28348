class BuysDate < ApplicationRecord
  belongs_to :sale
  has_one :buy
  belongs_to :user
end

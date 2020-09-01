class Buy < ApplicationRecord
  belongs_to :buys_date

  validates :code, :area_id, :city, :address, :tel, presence: true
end

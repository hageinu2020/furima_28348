class Sale < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :genre
  belongs_to_active_hash :status
  belongs_to_active_hash :fee
  belongs_to_active_hash :area
  belongs_to_active_hash :day

  #空の投稿を保存できないようにする
  validates :name, :text, :genre_id, :status_id, :fee_id, :area_id, :day_id, :price, presence: true

  #ジャンルの選択が「--」の時は保存できないようにする
  validates :genre_id, :status_id, :fee_id, :area_id, :day_id, numericality: { other_than: 0 }

  #金額が設定した金額内であること
  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}

end

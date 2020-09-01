class UsersBuy
  include ActiveModel::Model
  attr_accessor :code, :area_id, :city, :address, :building, :tel, :user_id, :sale_id, :token

  # 郵便番号のバリデーション
  validates :code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
  # 都道府県のバリデーション
  validates :area_id, numericality: { other_than: 0, message: "can't be blank" }
  # 電話番号のバリデーション
  VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/.freeze
  validates_format_of :tel, with: VALID_PHONE_REGEX, message: 'にはハイフンを使用しないでください。'
  # カード情報のバリデーション
  # 市町村のバリデーション
  # 住所のバリデーション
  with_options presence: true do
  validates :token, :city, :address
  end

  def save
    buydate = BuysDate.create(user_id: user_id, sale_id: sale_id)
    Buy.create(code: code, area_id: area_id, city: city, address: address, building: building, tel: tel, buys_date_id: buydate.id)
  end
end

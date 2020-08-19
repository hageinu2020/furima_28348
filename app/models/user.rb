class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, presence: true

  NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/.freeze
  validates_format_of :first_name, with: NAME_REGEX, message: 'には全角文字を使用してください' 
  validates_format_of :family_name, with: NAME_REGEX, message: 'には全角文字を使用してください' 

  KANA_REGEX = /\A([ァ-ン]|ー)+\z/.freeze
  validates_format_of :first_kana, with: KANA_REGEX, message: 'には全角カタカナを使用してください'
  validates_format_of :family_kana, with: KANA_REGEX, message: 'には全角カタカナを使用してください'

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください' 

  validates :birthday, presence: true
end

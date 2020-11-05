class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i
         validates :password, format: { with: VALID_PASSWORD_REGEX }
         validates :nickname,   presence: true
         validates :birth_date, presence: true
         validates :last_name, presence: true
         validates :last_name, format: { with: /\A[一-龥ぁ-ん]/}
         validates :first_name, presence: true
         validates :first_name, format: { with: /\A[ぁ-ん一-龥]/}
         validates :last_name_kana, presence: true
         validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/}
         validates :first_name_kana, presence: true
         validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/}
end

class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, # 他のモジュール
         :authentication_keys => [:username] # ユーザー名を認証キーにする

  validates :username, presence: true, uniqueness: true

  has_many :words
  has_many :likes, dependent: :destroy
  has_many :word_comments, dependent: :destroy



  def customer_status
    if is_withdrawal == true
      "退会"
    else
      "有効"
    end
  end

end
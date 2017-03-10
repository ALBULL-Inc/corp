class Account < ApplicationRecord
  devise :database_authenticatable, :confirmable, :recoverable, :registerable,# :lockable,
    :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook, :google, :line]

  attr_writer :email_require

  # Association
  has_one :profile, dependent: :destroy
  delegate :firstname, :lastname, :nickname, :gender, :blood, :birthday, to: :profile
  has_many :oauths, class_name: 'AccountOAuth', dependent: :destroy
  has_many :entries, dependent: :destroy

  # Scope
  default_scope -> { eager_load(:profile) }

  # OAuthでの登録はemailは不問
  def email_required?
    (@email_require || !email.blank?) && super
  end
end

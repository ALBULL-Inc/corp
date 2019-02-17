class Account < ApplicationRecord
  devise :database_authenticatable, :confirmable, :recoverable, :registerable,# :lockable,
    :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook, :google, :line]

  include Gravtastic
  gravtastic secure: true, size: 120

  attr_writer :email_require

  # Association
  has_one :profile, dependent: :destroy
  delegate :firstname, :lastname, :nickname, :gender, :blood, :birthday, :fullname, to: :profile
  has_many :oauths, class_name: 'AccountOAuth', dependent: :destroy
  has_many :entries, dependent: :destroy
  has_one :subscription
  has_one :line_oauth, -> { where(provider: 'line') }, class_name: 'AccountOAuth'
  has_many :dartslive_cards

  # Scope
  default_scope -> { eager_load(:profile) }

  # Callback
  before_create :build_profile
  after_create  :payjp_customer_create

  class << self
    def current_account=(account)
      Thread.current[:current_account] = account
    end

    def current_account
      Thread.current[:current_account]
    end
  end

  def disp_nickname
    r = self.nickname
    if r.blank?
      r = "呼称未設定"
    end
    r
  end


  # OAuthでの登録はemailは不問
  def email_required?
    (@email_require || !email.blank?) && super
  end

  def myself?
    Account.current_account && Account.current_account.id == self.id
  end

  def payjp_customer_create
    c = Payjp::Customer.create(
      email: self.email,
      metadata: { account_id: self.id },
    )
    self.update!(cus_id: c.id)
    self
  end
end

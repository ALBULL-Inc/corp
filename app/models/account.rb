class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :confirmable, :recoverable, :registerable,# :lockable,
    :rememberable, :trackable, :validatable, :omniauthable, :omniauth_providers => [:facebook, :google]
end

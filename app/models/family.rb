class Family < ApplicationRecord
  before_create :issue_code

  has_many :children
  has_many :places, through: :children
  has_many :usage_records, through: :children
  has_many :usage_months, through: :usage_records, source: :month
  has_many :usage_places, through: :usage_records, source: :place

  def self.find_code(code)
    input_code = Digest::MD5.hexdigest(code)
    where(md5_code: input_code).first
  end

  def decrypt_code
    @decrypt_code ||= encryptor.decrypt_and_verify(self.encrypted_code)
  end

  def allow_place_ids
    @allow_place_ids ||= self.usage_place_ids.uniq
  end

  private
  def issue_code
    fcd = SecureRandom.urlsafe_base64(4)
    self.encrypted_code = encryptor.encrypt_and_sign(fcd)
    self.md5_code = Digest::MD5.hexdigest(fcd)
  end

  def encryptor
    return @encryptor if @encryptor
    secret = Rails.application.secrets.secret_key_base
    @encryptor = ::ActiveSupport::MessageEncryptor.new(secret, cipher: 'aes-256-cbc')
  end
end

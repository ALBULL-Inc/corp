module Encryptor
  extend ActiveSupport::Concern

  included do
    def cryptor
      secret = Settings.crypt.secret
      ::ActiveSupport::MessageEncryptor.new(secret, cipher: 'aes-256-cbc')
    end
  end

  module ClassMethods
    def crypt(*args)
      args.each do |column|
        if self.table_exists?
          self.new
          define_method "#{column}_with_crypt" do
            begin
              val = send("#{column}_without_crypt")
              cryptor.decrypt_and_verify(val)
            rescue ActiveSupport::MessageVerifier::InvalidSignature => e
              nil
            rescue NoMethodError => e
              val
            end
          end
          alias_method_chain column, :crypt

          define_method "#{column}_with_crypt=" do |args|
            send("#{column}_without_crypt=", cryptor.encrypt_and_sign(args))
          end
          alias_method_chain "#{column}=", :crypt
        end
      end
    end
  end
end

class ActiveRecord::Base
  include Encryptor
end

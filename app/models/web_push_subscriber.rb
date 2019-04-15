# -*- encoding : utf-8 -*-
class WebPushSubscriber < Subscriber
  # Validation
  validates :registration_key, uniqueness: :type
end

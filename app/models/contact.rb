class Contact < ApplicationRecord
  crypt :content
  TYPE = {
    email:   1,
    tel:     2,
    address: 3,
  }

  belongs_to :profile

  validates :contact_type, :content, presence: true
  validates :contact_type, inclusion: { in: TYPE.values }
end

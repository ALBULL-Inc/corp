class Background < ApplicationRecord
  TYPE = {
    education:  1,
    employment: 2,
  }

  belongs_to :profile

  validates :background_type, :site, :joined_on, presence: true
  validates :background_type, inclusion: { in: TYPE.values }
end

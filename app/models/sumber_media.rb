class SumberMedia < ActiveRecord::Base
  has_many :rekam_jejaks

  validates :link,
  					presence: true,
  					uniqueness: true
end

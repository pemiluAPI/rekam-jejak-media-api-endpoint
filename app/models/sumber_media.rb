class SumberMedia < ActiveRecord::Base
  has_many :rekam_jejaks

  validates :link,
  					presence: true,
  					uniqueness: true

  def self.get(link = nil)
  	where(link: link).first_or_create
  end
end

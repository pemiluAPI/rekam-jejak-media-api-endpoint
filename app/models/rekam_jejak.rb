class RekamJejak < ActiveRecord::Base
  belongs_to :paslon
  belongs_to :sumber_media

  validates :judul, :link,
  					presence: true

  delegate :link, to: :sumber_media, prefix: true, allow_nil: true
  scope :sumber, lambda{ |sumber| joins(:sumber_media).where("LOWER(sumber_media.link) LIKE ?", "%#{sumber.downcase}%") unless sumber.nil? }

end

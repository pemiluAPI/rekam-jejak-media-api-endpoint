class SumberMedia < ActiveRecord::Base
  has_many :rekam_jejaks

  validates :link,
  					presence: true,
  					uniqueness: true

  scope :by_id, lambda{ |id| where("id = ?", id) unless id.nil? }

  def self.get(link = nil)
  	where(link: link).first_or_create
  end

  def self.apiall(data = {})
    sumber_media          = self.by_id(data[:id])
    paginate_sumber_media = sumber_media.limit(setlimit(data[:limit])).offset(data[:offset])

    return {
      sumber_media: paginate_sumber_media.map{|value| value.construct},
      count: paginate_sumber_media.count,
      total: sumber_media.count
		}
  end

  def construct
    return {
      id: id,
      link: link
    }
  end

protected
  def self.setlimit(limit)
    limit = (limit.to_i == 0 || limit.empty?) ? 1000 : limit
  end

end

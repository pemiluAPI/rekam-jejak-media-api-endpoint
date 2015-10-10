class RekamJejak < ActiveRecord::Base
  belongs_to :paslon
  belongs_to :sumber_media

  validates :judul, :link,
  					presence: true

  scope :by_id, lambda{ |id| where("id = ?", id) unless id.nil? }
  scope :by_paslon_id, lambda{ |paslon_id| where("paslon_id = ?", paslon_id) unless paslon_id.nil? }
  scope :by_sumber_media_id, lambda{ |sumber_media_id| where("sumber_media_id = ?", sumber_media_id) unless sumber_media_id.nil? }

  def self.apiall(data = {})
    rekam_jejak          = self.by_id(data[:id]).by_paslon_id(data[:paslon_id]).by_sumber_media_id(data[:sumber_media_id])
    paginate_rekam_jejak = rekam_jejak.limit(setlimit(data[:limit])).offset(data[:offset])

    return {
      rekam_jejak: paginate_rekam_jejak.map{|value| value.construct},
      count: paginate_rekam_jejak.count,
      total: rekam_jejak.count
		}
  end

  def construct
    return {
      id: id,
      paslon: (handle(paslon)),
      sumber_media: (handle(sumber_media)),
      judul: judul,
      link: link,
      content_media: content_media
    }
  end

protected
  def self.setlimit(limit)
    limit = (limit.to_i == 0 || limit.empty?) ? 1000 : limit
  end

  def handle(obj)
    obj.present? ? obj.construct : {}
  end

end

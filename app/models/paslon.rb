class Paslon < ActiveRecord::Base
  has_many :rekam_jejaks

  validates :nama_calon, :nama_wakil_calon,
  					presence: true

  scope :paslon_id, lambda{ |paslon_id| where("paslons.id = ?", paslon_id) unless paslon_id.nil? }
  scope :calon, lambda{ |nama_calon| where("LOWER(paslons.nama_calon) LIKE ?", "%#{nama_calon.downcase}%") unless nama_calon.nil? }
  scope :wakil_calon, lambda{ |nama_wakil_calon| where("LOWER(paslons.nama_wakil_calon) LIKE ?", "%#{nama_wakil_calon.downcase}%") unless nama_wakil_calon.nil? }
  scope :sumber, lambda{ |sumber| joins(rekam_jejaks: [:sumber_media]).where("LOWER(sumber_media.link) LIKE ?", "%#{sumber.downcase}%") unless sumber.nil? }

  def self.rekam_jejak_medias(data = {})
    paslons          = self.sumber(data[:sumber]).calon(data[:nama_calon]).wakil_calon(data[:nama_wakil_calon])
    paginate_paslons = paslons.limit(setlimit(data[:limit])).offset(data[:offset])

    return {
      paslons: paginate_paslons.map{|paslon|
                  paslon.rekam_jejak_media({sumber: data[:sumber], limit: data[:limit_media], offset: data[:offset_media]})
                },
      count: paginate_paslons.count,
      total: paslons.count
		}
  end

  def self.gsearch(limit = 10)
    all.each do |paslon|
      paslon.record(Google::Search::Web.new(query: paslon.qwords), {limit: limit})
      puts "[Record Web] data rekam jejak for paslon id #{paslon.id}"
      paslon.record(Google::Search::Video.new(query: paslon.qwords), {limit: limit})
      puts "[Record Video] data rekam jejak for paslon id #{paslon.id}"
    end
  end

  def rekam_jejak_media(data = {})   
    rekam_jejaks          = self.rekam_jejaks.sumber(data[:sumber])
    paginate_rekam_jejaks = rekam_jejaks.limit(self.class.setlimit(data[:limit])).offset(data[:offset])

  	return {
      paslon_id: self.id,
      nama_calon: self.nama_calon,
      nama_wakil_calon: self.nama_wakil_calon,
      media: paginate_rekam_jejaks.map{|rekam_jejak| {
                sumber: rekam_jejak.sumber_media_link,
                judul: rekam_jejak.judul,
                link: rekam_jejak.link,
                content_media: rekam_jejak.content_media
              }},
      count: paginate_rekam_jejaks.count,
      total: rekam_jejaks.count
    }
  end

  def record(search, options = {})
    search.each_with_index do |result, index|
      break if index > (options[:limit] - 1)
      self.rekam_jejaks.build({sumber_media_id: SumberMedia.get(result.visible_uri).id, judul: result.title, link: result.uri, content_media: result.content})
      self.save
    end
  end

protected
  def self.setlimit(limit)
    limit = (limit.to_i == 0 || limit.empty?) ? 1000 : limit
  end

end

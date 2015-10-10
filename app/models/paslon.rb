class Paslon < ActiveRecord::Base
  include ActionView::Helpers::SanitizeHelper

  has_many :rekam_jejaks

  validates :nama_calon, :nama_wakil_calon,
  					presence: true

  scope :by_id, lambda{ |id| where("id = ?", id) unless id.nil? }

  def self.apiall(data = {})
    paslon          = self.by_id(data[:id])
    paginate_paslon = paslon.limit(setlimit(data[:limit])).offset(data[:offset])

    return {
      paslon: paginate_paslon.map{|value| value.construct},
      count: paginate_paslon.count,
      total: paslon.count
    }
  end

  def self.gsearch(limit = 10)
    all.each do |paslon|
      paslon.record(Google::Search::News.new(query: paslon.qwords), {limit: limit})
      puts "[Record News] data rekam jejak for paslon id #{paslon.id}"
      paslon.record(Google::Search::Video.new(query: paslon.qwords), {limit: limit})
      puts "[Record Video] data rekam jejak for paslon id #{paslon.id}"
    end
  end

  def record(search, options = {})
    search.each_with_index do |result, index|
      break if index > (options[:limit] - 1)
      self.rekam_jejaks.build({sumber_media_id: SumberMedia.get(result.visible_uri).id, judul: sanitize(result.title, tags: []), link: result.uri, content_media: sanitize(result.content, tags: [])})
      self.save
    end
  end

  def construct
    return {
      id: id,
      nama_calon: nama_calon,
      nama_wakil_calon: nama_wakil_calon,
      qwords: qwords
    }
  end

protected
  def self.setlimit(limit)
    limit = (limit.to_i == 0 || limit.empty?) ? 1000 : limit
  end

end

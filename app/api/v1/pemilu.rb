module Pemilu
  class APIv1 < Grape::API
    version 'v1', using: :accept_version_header
    prefix 'api'
    format :json

    resource :sumber_media do
      desc "Return list sumber_media"
      get do
        results = SumberMedia.apiall(params)
        {
          results: results
        }
      end
    end

    resource :paslon do
      desc "Return list paslon"
      get do
        results = Paslon.apiall(params)
        {
          results: results
        }
      end
    end

    resource :rekam_jejak do
      desc "Return list rekam_jejak"
      get do
        results = RekamJejak.apiall(params)
        {
          results: results
        }
      end
    end

  end
end
module Pemilu
  class APIv1 < Grape::API
    version 'v1', using: :accept_version_header
    prefix 'api'
    format :json

    resource :paslon do

      desc "Return all paslon with rekam jejak media"
      get do
        results = Paslon.rekam_jejak_medias(params)
        
        {
          results: results
        }
      end

      desc "Return a paslon with rekam jejak media"
      params do
        requires :id, type: String, desc: "Paslon ID."
      end
      route_param :id do
        get do
          results = Paslon.paslon_id(params[:id]).first.rekam_jejak_media(params)

          {
            results: results
          }
        end
      end
    end
  end
end
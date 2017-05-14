class ConstituenciesController < ApplicationController
    def index
      @constituencies = Constituency.all

      respond_to do |format|
        format.json do
          feature_collection = Constituency.to_feature_collection @constituencies
          render json: RGeo::GeoJSON.encode(feature_collection)
        end

        format.html
      end
  end
end

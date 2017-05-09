class CountiesController < ApplicationController
    def index
      @counties = County.all

      respond_to do |format|
        format.json do
          feature_collection = County.to_feature_collection @counties
          render json: RGeo::GeoJSON.encode(feature_collection)
        end

        format.html
      end
  end

end

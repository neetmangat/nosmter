class PlacesController < ApplicationController
    include Pagy::Backend

    def index
        @pagy, @places = pagy(Place.all, page: params[:page], items: 3)
    end

end

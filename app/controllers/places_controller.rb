class PlacesController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]
    include Pagy::Backend

    def index
        @pagy, @places = pagy(Place.all, page: params[:page], items: 5)
    end

    def new
        @place = Place.new 
    end

    def show
        @place = Place.find(params[:id])
    end

    def edit
        @place = Place.find(params[:id])
    end

    def update
        @place = Place.find(params[:id])
        @place.update_attributes(place_params)
        redirect_to root_path
    end

    def create
        current_user.places.create(place_params)
        redirect_to root_path
    end

    private

    def place_params
        params.require(:place).permit(:name, :description, :address)
    
    end
    

end

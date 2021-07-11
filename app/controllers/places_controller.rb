class PlacesController < ApplicationController
    PLACES_PER_PAGE = 3
    def index
        @page = params.fetch(:page, 0).to_i
        @places = Place.offset(@page * PLACES_PER_PAGE).limit(PLACES_PER_PAGE)
    end

    before_action :authenticate_user!, only: [:new, :create]

    def new
        @place = Place.new
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
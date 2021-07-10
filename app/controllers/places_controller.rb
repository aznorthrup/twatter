class PlacesController < ApplicationController
    PLACES_PER_PAGE = 3
    def index
        @page = params.fetch(:page, 0).to_i
        @places = Place.offset(@page * PLACES_PER_PAGE).limit(PLACES_PER_PAGE)
    end

    def new
        @place = Place.new
    end

end
class RestaurantsController < ApplicationController
    before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

    def new
        @restaurant = Restaurant.new
    end

    def create
        @restaurant = Restaurant.new(restaurant_params)
        @restaurant.save
        redirect_to restaurant_path(@restaurant)
    end

    def index
        @restaurants = Restaurant.all
        @markers = @restaurants.geocoded.map do |restaurant|
            {
              lat: restaurant.latitude,
              lng: restaurant.longitude
            }
          end
    end

    def show
        # @restaurant = Restaurant.find(params[:id])
    end

    def edit
        # @restaurant = Restaurant.find(params[:id])
    end

    def update
        # @restaurant = Restaurant.find(params[:id])
        @restaurant = Restaurant.update(restaurant_params)
        redirect_to restaurant_path(@restaurant)
    end

    def destroy
        # @restaurant = Restaurant.find(params[:id])
        @restaurant.destroy
        redirect_to restaurants_path
    end

    private

    def restaurant_params
        params.require(:restaurant).permit(:name, :address)
    end

    def set_restaurant
        @restaurant = Restaurant.find(params[:id])
    end

end

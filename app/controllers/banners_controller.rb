class BannersController < ApplicationController

  def index
  end

  def new
    @banner = Banner.new
  end

  def create
    @banner = Banner.new(params.require(:banner).permit(:start_date, :end_date, :location, :headline, :subcopy, :image))

    @banner.save

    redirect_to @banner
  end

  def show
    @banner = Banner.find(params[:id])
  end

end

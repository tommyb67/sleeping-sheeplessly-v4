class BannersController < ApplicationController
  before_action :set_banner, only: [:show]

  def index
  end

  def new
    @banner = Banner.new
  end

  def create
    @banner = Banner.new(banner_params)

    if @banner.save
      redirect_to @banner, notice: 'Your banner was created successfully'
    else
      render :new
    end
  end

  def show
  end

  private

    def banner_params
      params.require(:banner).permit(:start_date, :end_date, :location, :headline, :subcopy, :image)
    end

    def set_banner
      @banner = Banner.find(params[:id])
    end
end

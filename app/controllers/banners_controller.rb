class BannersController < ApplicationController
  before_action :set_banner, only: [:show, :edit, :update]

  def index
    @banners = Banner.all
  end

  def new
    @banner = Banner.new
  end

  def create
    @banner = Banner.new(banner_params)
    @banner.user_id = current_user.id

    if @banner.save
      redirect_to @banner, notice: 'Your banner was created successfully'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @banner.update(banner_params)
      redirect_to @banner, notice: 'Your banner was edited successfully'
    else
      render :edit
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

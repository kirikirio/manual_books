class Admin::ManualsController < ApplicationController
  before_action :admin_user

  def index
  end

  def new
    @manual = Manual.new
    @manuals = Manual.where(params[:id]) 
  end

    def create
    @manual = Manual.new(manual_params)
    # @manual.image.build
    @manual.save
  end

  def show
    @pdffile = Manual.find(params[:id]) 
  end

  def edit
    @manual = Manual.find(params[:id])
    
  end

  def update
    @manual = Manual.find(params[:id])
    @manual.update(manual_params)
  end

  def delete
  end




  def manual_params
    params.require(:manual).permit(
                            :name,
                            :image,
                            :category,
                            :manual_status,
                              )
  end

    def admin_user
    redirect_to(root_path) unless user_logged_in? && current_user.admin?
  end

  def user_logged_in?
    !current_user.nil?
  end

end

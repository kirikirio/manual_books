class Admin::ManualsController < ApplicationController
  before_action :admin_user

  def new
    @manual = Manual.new
  end

    def create
    @manual = Manual.new(manual_params)
    # @manual.image.build
    @manual.save
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

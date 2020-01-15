class Admin::ManualsController < ApplicationController
  # before_action :admin_user

  def index
  end

  def new
    if current_user.admin?
    @manual = Manual.new
    @manuals = Manual.where(params[:id])
    else 
      flash[:notice] = "管理者権限がありません"
      redirect_to root_path
    end
      
  end

    def create
    @manual = Manual.new(manual_params)
    # @manual.image.build
    @manual.save
  end

  def edit
    @manual = Manual.find(params[:id])
    
  end

  def update
    @manual = Manual.find(params[:id])
    if @manual.update(manual_params)
      flash[:notice] = "更新しました"
      redirect_to root_path
    end
  end

  def delete
  end

  def destroy
    @manual = Manual.find(params[:id])
    if @manual.destroy
      flash[:notice] = "削除しました"
      redirect_to root_path
    end
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

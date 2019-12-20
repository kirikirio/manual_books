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

  def downloadpdf
  myfile=Myfile.find(params[:id])
  filepath = Rails.root.join('public',myfile.filename)
  stat = File::stat(filepath)
  send_file(filepath, :filename => myfile.filename, :length => stat.size)
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

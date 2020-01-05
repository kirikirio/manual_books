class ManualsController < ApplicationController
  
  before_action :set_submodel, only: [:top, :rezi, :seisou, :cofee, :sekkyaku, :sonota]
  before_action :set_search, only: [:index, :show]
  

  def index
    @manual = Manual.limit(4).where(params[:id]).order("created_at DESC")
  end

  def new
    @users = User.all
    @manual = Manual.new
    # @manual.image.image.build
    
    # @manuals = Manual.all
    # @manual = Manual.find(params[:id])
  end

  def show
    @manual = Manual.find(params[:id])
    @pdffile = Manual.find(params[:id]) 
  end




  
  def list
    @search_word = params[:search]
    @searches = Manual.where('name LIKE(?)', "%#{params[:search]}%").limit(50)if @search_word.present?
  end

  def create
    @manual = Manual.new(manual_params)
    # @manual.image.build
    @manual.save
  end

  def top

  end
  def rezi
    @rezi = Manual.where(category:"接客・販売")
  end

  def seisou
    @seisou = Manual.where(category:"カウンター内")
  end
  
  def flyer
    @flyer = Manual.where(category:"清掃")
  end

  def cofee
    @cofee = Manual.where(category:"発注")
  end

  def sekkyaku
    @sekkyaku = Manual.where(category:"ロッピー")
  end

  def sonota
    @sonota = Manual.where(category:"その他")
  end


  private

  def manual_params
    params.require(:manual).permit(
                            :name,
                            :image,
                            :category,
                            :manual_status,
                              )
  end

  def search_params
    params.require(:q).permit(:gearname_or_title_or_review_cont)
  end

  def set_submodel
    @rezi = Manual.where(category:"接客・販売")
    @seisou = Manual.where(category:"カウンター内")
    @flyer = Manual.where(category:"清掃")
    @cofee = Manual.where(category:"発注")
    @sekkyaku = Manual.where(category:"ロッピー")
    @sonota = Manual.where(category:"その他")
  end

  def set_search
    @search = Manual.ransack(params[:q])
  end


end


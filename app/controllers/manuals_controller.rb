class ManualsController < ApplicationController
  def index
    @manual = Manual.limit(5).where(params[:id]).order("created_at DESC")
  end
  def new
    @manual = Manual.new
    # @manual.image.image.build
    
    # @manuals = Manual.all
    # @manual = Manual.find(params[:id])
  end
  
  def show
  
  end

  def create
    @manual = Manual.new(manual_params)
    # @manual.image.build
    @manual.save
  end

  def rezi
    @rezi = Manual.where(category:"レジ")
  end

  def seisou
    rezi = Manual.where(category:"清掃")
  end
  
  def cofee
    rezi = Manual.where(category:"コーヒーマシン")
  end

  def sekkyaku
    rezi = Manual.where(category:"接客")
  end

  def sonota
    rezi = Manual.where(category:"その他")
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
end


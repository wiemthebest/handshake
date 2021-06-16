class AdsController < ApplicationController
  before_action :set_Ad, only: [:show, :update, :destroy, :edit]

  def index
    @ads = Ad.all 
  end

  def new
    @ad=Ad.new
  end

  def show
    @ad = Ad_find
  end

  def ad_find
    Ad.find(params[:id])
  end

  def create
    #Récupération des champs du formulaire
    @Ad = ad.new(
      'date' => date,
      'title' => params[:title],
      'description' => params[:description],
      'category' => params[:category],
      'address' => params[:address],
      'zip_code' => params[:zip_code],
      'phone' => params[:phone],
      'type' => params[:type],

    )
  end 

  def update
    @ad.cover.attach(params[:cover])
    if @ad.update(Ad_params)
      redirect_to Ads_dashboard_path, notice:"Votre Ad a été mise à jour !"
    else
      render :edit
    end
  end

  def destroy
    @ad.destroy
    redirect_to Ads_dashboard_path, notice:"Votre Annonce  a été supprimée !"
  end

  private

  def set_Ad
    @ad = Ad.find(params[:id])
  end

  def Ad_params
    params.require(:Ad).permit(
      :cover,
      :title,
      :phone,
      :description,
      :zip_code,
      :addresss
     )
  end
end

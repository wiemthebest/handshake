class AdsController < ApplicationController
  include ApplicationHelper
  
  def index
    @ads = Ad.all
  end
  def show
   @ad= Ad.find(params[:id])
  end

  
  def new
  end
  def create
    @ad=Ad.new(title: params[:title],
    description:params[:description],
    adress: params[:adress],
    category:params[:category],
    date:params[:date],
    zip_code:params[:zip_code],
    phone:params[:phone])
    
    if @ad.save
      redirect_to ads_path(@ad.id)
    else
      redirect_to new_ad_path
    end
  end
  

  def edit
    @ad=Ad.update(title: params[:title],
    description:params[:description],
    adress: params[:adress],
    category:params[:category],
    date:params[:date],
    zip_code:params[:zip_code],
    phone:params[:phone])
    redirect_to ad_path(@ad.id)
  end

  def destroy
    @ad.destroy
    redirect_to ad_path, notice:"Votre Annonce  a été supprimée !"
  end

  def update
    @ad.cover.attach(params[:cover])
    if @ad.update(Ad_params)
      redirect_to ad_path, notice:"Votre Ad a été mise à jour !"
    else
      render :edit
    end
  end




end








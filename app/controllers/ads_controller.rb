class AdsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]
  before_action :is_ad_admin?, only: [:edit]
def index
    @ads = Ad.all
end

def show
    @ad = Ad.find(params[:id])
    
end

def new
end

def create

    @ad = Ad.create(
      date: params[:date],
      title: params[:title],
      adress: params[:adress],
      description: params[:description],
      zip_code: params[:zip_code],
      phone: params[:phone],
      user: current_user,
      classification: current_user.classification
    )

    if @ad.save
        redirect_to ad_path(@ad.id), notice: "votre annonce a été bien créer"
      else
        render :new,  notice: "Erreur lors de la création de votre mission"
      end
    
  end

  def edit
    @ad = Ad.find(params[:id])
  end

  def update
    @ad = Ad.find(params[:id])
 

    @ad.update(
      date: params[:date],
      title: params[:title],
      adress: params[:adress],
      description: params[:description],
      zip_code: params[:zip_code],
      phone: params[:phone]
    )

    if @ad.save
        redirect_to ad_path(@ad.id), notice: "votre annonce a été bien modifierr"
      else
        render :new,  notice: "Erreur lors de la création de votre mission"
      end
  end

  def destroy
    @ad = Ad.find(params[:id])
    if @ad.destroy
      redirect_to ads_path, notice: "Suppression de l'événement effectuée"
    else
      flash.now[:notice] = "L'événement n'a pas pu être supprimé"
      render :edit
    end
  end

  def is_ad_admin?
    @ad = Ad.find(params[:id])
    if @ad.user == current_user
      return true
    else
      redirect_to ads_path, danger: "You didn't create this event"
    end
  end
  
end

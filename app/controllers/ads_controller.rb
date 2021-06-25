class AdsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]
  before_action :is_ad_admin?, only: [:edit]

def index
    @ads = Ad.all.sort{|a,b| sorting(a,b)}
end

def benevoles
  @ads = Ad.where(classification: options_for_classification[0])
  if @ads.nil?
    return @ads
  end
  @ads = @ads.sort{|a,b| sorting(a,b)}
end

def demandeurs
  @ads = Ad.where(classification: options_for_classification[1])
  if @ads.nil?
    return @ads
  end
  @ads = @ads.sort{|a,b| sorting(a,b)}
end



def sorting(a,b)
  puts " #{a.distance_from(current_user)}  <=> #{b.distance_from(current_user)}"
      if (a.distance_from(current_user) && b.distance_from(current_user))
        return a.distance_from(current_user)  <=> b.distance_from(current_user)
        elsif b.to_coordinates
        return 1
        else 
        return 0
      end
end


def show
    @ad = Ad.find(params[:id])
    @distance = @ad.distance_from(current_user)
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
      city: params[:city],
      phone: params[:phone],
      user: current_user,
      classification: current_user.classification,
      category_id: params[:category_id]
    )

    if @ad.save
        redirect_to ad_path(@ad.id), notice: "Votre annonce a été bien crée"
      else
        render :new,  notice: "Erreur lors de la création de votre annonce"
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
      city: params[:city],
      phone: params[:phone]
    )

    if @ad.save
        redirect_to ad_path(@ad.id), notice: "Votre annonce a été bien modifiée"
      else
        render :new,  notice: "Erreur lors de la création de votre annonce"
      end
  end

  def destroy
    @ad = Ad.find(params[:id])
    if @ad.destroy
      redirect_to ads_path, notice: "La suppression de l'annonce a bien été effectuée"
    else
      flash.now[:notice] = "L'annonce n'a pas pu être supprimée"
      render :edit
    end
  end

  def is_ad_admin?
    @ad = Ad.find(params[:id])
    if @ad.user == current_user
      return true
    else
      redirect_to ads_path, danger: "Vous n'avez pas créee cette annonce"
    end
  end
  
end

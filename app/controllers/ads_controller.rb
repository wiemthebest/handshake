class AdsController < ApplicationController

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
      title: params[:title],
      description: params[:description],
      adress: params[:adress],
      zip_code: params[:zip_code],
      phone: params[:phone]
      
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
   if @ad.update(ad_params)
    redirect_to ad_path, notice:"Votre mission a été mise à jour !"
    else
      render :edit
    end
  end
    
 def destroy
    @ad.destroy
    redirect_to ad_path, notice:"Votre mission a été supprimée !"
  end


  private

  def ad_params
    params.require(:ad).permit(
      :title,
      :phone,
      :description,
      :date,
      :zip_code,
     )
  end

  
end

class AdsController < ApplicationController

def index
    @ads = Ad.all
end

def show
    @ad = Ad.find(params[:id])
    @date = @ad.date.to_date.strftime('%d %m %Y')
    
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
        redirect_to ad_index_path,  notice: "Votre mission a bien été créée"
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

  def ad_creator?
    unless Ad.find(params[:id]).organizer == current_user
      redirect_to ad_path, notice: "Ce n'est pas votre événement"
    end
  end
end

class AdsController < ApplicationController
  include ApplicationHelper


  
  def index
    @ads = Ad.all
  end
  
  def show
    @ad = ad_find
    @id = params[:id]
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
     redirect_to ads_path, alert: 'annonce enregistré !'
    else
      @ad.errors.messages.each_with_index do |m, index|
        flash.now[:alert] = m[index + 1][0]
      end
      render :new
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

  


end








class ImagesController < ApplicationController
      def create
        @ad =  Ad.find(params[:ad_id])
        @ad.image.attach(params[:image])
        redirect_to ad_path(@ad)
    end
end

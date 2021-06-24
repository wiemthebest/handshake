class AddGeocodeToAds < ActiveRecord::Migration[5.2]
  def change
    add_column :ads, :latitude, :string
    add_column :ads, :longitude, :string
    add_column :ads, :city, :string
  end
end

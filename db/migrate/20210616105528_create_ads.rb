class CreateAds < ActiveRecord::Migration[5.2]
  def change
    create_table :ads do |t|
      t.string :type
      t.string :category
      t.string :title
      t.text :description
      t.string :adress
      t.datetime :date
      t.string :zip_code
      t.string :phone
      t.timestamps
    end
  end
end

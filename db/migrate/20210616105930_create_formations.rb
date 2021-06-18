class CreateFormations < ActiveRecord::Migration[5.2]
  def change
    create_table :formations do |t|
      t.string :type
      t.string :title
      t.text :description
      t.datetime :start_date
      t.datetime :end_date
      t.string :localisation

      t.timestamps
    end
  end
end

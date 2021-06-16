class CreateInscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :inscriptions do |t|
      t.integer :user_id
      t.integer :formation_id

      t.timestamps
    end
  end
end

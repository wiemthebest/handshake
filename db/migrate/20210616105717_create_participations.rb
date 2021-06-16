class CreateParticipations < ActiveRecord::Migration[5.2]
  def change
    create_table :participations do |t|
      t.string :status
      t.integer :user_id
      t.integer :ad_id

      t.timestamps
    end
  end
end

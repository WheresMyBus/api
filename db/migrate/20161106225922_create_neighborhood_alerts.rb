class CreateNeighborhoodAlerts < ActiveRecord::Migration[5.0]
  def change
    create_table :neighborhood_alerts do |t|
      t.string :user_id
      t.integer :alert_type
      t.text :description
      t.references :neighborhood, foreign_key: true

      t.timestamps
    end
  end
end

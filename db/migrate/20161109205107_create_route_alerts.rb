class CreateRouteAlerts < ActiveRecord::Migration[5.0]
  def change
    create_table :route_alerts do |t|
      t.string :user_id
      t.integer :alert_type
      t.text :description
      t.string :route_id

      t.timestamps
    end
  end
end

class CreateAffectedRoutes < ActiveRecord::Migration[5.0]
  def change
    create_table :affected_routes do |t|
      t.references :neighborhood_alert, foreign_key: true
      t.string :route_id

      t.timestamps
    end
  end
end

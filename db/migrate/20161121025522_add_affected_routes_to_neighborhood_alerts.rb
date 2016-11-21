class AddAffectedRoutesToNeighborhoodAlerts < ActiveRecord::Migration[5.0]
  def change
    add_column :neighborhood_alerts, :affected_routes, :text
  end
end

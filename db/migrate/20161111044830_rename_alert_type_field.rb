class RenameAlertTypeField < ActiveRecord::Migration[5.0]
  def change
    rename_column :neighborhood_alerts, :alert_type, :issue_type
    rename_column :route_alerts, :alert_type, :issue_type
  end
end

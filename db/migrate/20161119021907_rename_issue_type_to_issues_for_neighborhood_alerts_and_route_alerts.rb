class RenameIssueTypeToIssuesForNeighborhoodAlertsAndRouteAlerts < ActiveRecord::Migration[5.0]
  def change
    rename_column :neighborhood_alerts, :issue_type, :issues
    rename_column :route_alerts, :issue_type, :issues
  end
end

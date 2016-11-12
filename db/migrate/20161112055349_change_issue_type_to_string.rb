class ChangeIssueTypeToString < ActiveRecord::Migration[5.0]
  def change
    change_column :neighborhood_alerts, :issue_type, :string
    change_column :route_alerts, :issue_type, :string
  end
end

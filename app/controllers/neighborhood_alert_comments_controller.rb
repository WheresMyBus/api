class NeighborhoodAlertCommentsController < AlertCommentsController
  private

  def set_alert
    @alert = NeighborhoodAlert.find params[:neighborhood_alert_id]
  end
end

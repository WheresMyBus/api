class RouteAlertCommentsController < AlertCommentsController
  private

  def set_alert
    @alert = RouteAlert.find params[:route_alert_id]
  end
end

class RouteAlertsController < AlertsController
  before_action :set_route, only: %i(index create)

  def index
    @alerts = @route.alerts
    render json: @alerts
  end

  def create
    @alert = @route.alerts.new alert_params

    if @alert.save
      render json: @alert, status: :created, location: @alert
    else
      render json: @alert.errors, status: :unprocessable_entity
    end
  end

  private

  def set_route
    @route = Route.find params[:route_id]
  end

  def set_alert
    @alert = RouteAlert.find params[:id]
  end
end

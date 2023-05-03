# frozen_string_literal: true

class PerformancesController < ApplicationController
  before_action :performance, only: %i[destroy]

  def index
    performances = Performance.all

    render json: performances,
           adapter: :json,
           each_serializer: PerformanceSerializer
  end

  def create
    performance = Performance.new(performance_params)

    if performance.save
      render json: performance,
             status: :created
    else
      render_unprocessable_entity(performance)
    end
  end

  def destroy
    @performance.destroy
  end

  private

  def performance_params
    params.require(:performance).permit(:name, :date_range)
  end

  def performance
    @performance ||= Performance.find(params[:id])
  end
end

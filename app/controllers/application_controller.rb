# frozen_string_literal: true

class ApplicationController < ActionController::API
  def render_unprocessable_entity(entity)
    render json: { error: 'Unprocessable entity', error_messages: entity.errors }, status: :unprocessable_entity
  end
end

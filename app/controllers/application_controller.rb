class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordInvalid, with: :record_invalid

  protected

  def record_invalid(exception)
    render json: { message: exception.message, errors: exception.record.errors }, status: 422
  end

end

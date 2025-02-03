class ApplicationController < ActionController::API
  respond_to :json
  before_action :authenticate_user!

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  # récupérer le user connecté en front sur nextjs grace au jti dans l'authorization
  # toutes les actions qui nécessitent current_user doit être récupérer par nextjs

  def authenticate_user!
    token = request.headers["Authorization"]&.split(" ")&.last
    if token
      decoded_token = JWT.decode(token, ENV["DEVISE_SECRET_KEY"], true, algorithm: "HS256")
      @current_user = User.find(decoded_token.first["sub"])
    else
      render json: { error: "User must be authenticated" }, status: :unauthorized
    end

  end

  private

  def record_not_found
    render json: { error: "Record not found" }, status: :not_found
  end
end

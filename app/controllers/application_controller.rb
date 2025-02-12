class ApplicationController < ActionController::API
  respond_to :json
  before_action :authenticate_user!

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  # récupérer le user connecté en front sur nextjs grace au jti dans l'authorization
  # toutes les actions qui nécessitent current_user doit être récupérer par nextjs

  def authenticate_user!
    if devise_controller?
      super
    else
      token = request.headers["Authorization"]&.split(" ")&.last
      if token
        begin
          payload = JWT.decode(token, ENV["DEVISE_JWT_SECRET_KEY"], true, algorithm: "HS256")[0]
          @current_user = User.find(payload['sub'])
        rescue JWT::DecodeError
          render json: { error: "Token invalide" }, status: :unauthorized
        end
      else
        render json: { error: "Non autorisé" }, status: :unauthorized
      end
    end
  end

  def set_current_user
    if devise_controller?
      super
    else
      token = request.headers["Authorization"]&.split(" ")&.last
      return unless token
      begin
        payload = JWT.decode(token, ENV["DEVISE_JWT_SECRET_KEY"], true, algorithm: "HS256")[0]
        @current_user = User.find(payload['sub'])
      rescue JWT::DecodeError
        @current_user = nil
      end
    end
  end


  private

  def record_not_found
    render json: { error: "Record not found" }, status: :not_found
  end
end

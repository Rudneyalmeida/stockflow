class ApplicationController < ActionController::Base
  require 'httparty'
  before_action :authenticate_user!, :configure_permitted_parameters, if: :devise_controller?
  helper_method :current_user_offer_count

  def get_company_data
    response = HTTParty.get("https://receitaws.com.br/v1/cnpj/#{params[:cnpj]}")
    render json: response.parsed_response
  end

  def current_user_offer_count
    current_user.offers.count
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone, :photo, :address, :cpnj])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :phone, :photo, :address, :cpnj])
  end
end

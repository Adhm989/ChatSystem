class ApplicationsController < ApplicationController
  def create
    application = Application.new(application_params)
    application.uuid = SecureRandom.uuid  # Generate UUID for application
    application.token = SecureRandom.hex(10)  # Generate a random token

    if application.save
      render json: application, status: :created
    else
      render json: application.errors, status: :unprocessable_entity
    end
  end

  def show
    application = Application.find_by(token: params[:token])
    render json: application
  end

  private

  def application_params
    params.require(:application).permit(:name, :token)
  end
end

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  protected

  def error_handler(response)
    respond_to do |format|
      format.html {
        error = JSON.parse(response)
        render json: "Unexpected Error: #{error['error']}", status: response.code
      }
      format.json {
        render json: response.body, status: response.code
      }
    end
  end

end

class ApplicationController < ActionController::API
    def index
        render json: {app: 'Rolldice API'}, status: :ok
    end
end

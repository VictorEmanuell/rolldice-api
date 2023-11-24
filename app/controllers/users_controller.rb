class UsersController < BaseController
    before_action :authenticate_user, except: [:create]

    def create
        user = User.new(user_params)

        if user.save
          render json: user
        else
          render json: {
            errors: user.errors
          }, status: :unprocessable_entity
        end
    end

    def user_info
      user = User.find_by(id: session[:user_id])

      if user.present?
          render json: user, status: :ok
      else
          render status: :bad_request
      end
    end

    def destroy
        user = User.find_by(id: params[:id])

        if user.present? user.destroy
            render status: :ok
        else
            render status: :conflict
        end
    end

    private

    def user_params
        params.require(:user).permit(:name, :id, :email)
    end
end

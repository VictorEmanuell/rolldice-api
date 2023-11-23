class UsersController < BaseController
    before_action :authenticate_user, only: [:destroy]

    def create
        @user = User.new(user_params)

        if @user.save
          render json: @user
        else
          render json: {
            errors: @user.errors
          }, status: :unprocessable_entity
        end
    end

    def destroy
        @user = User.find_by(id: params[:id])

        if @user.present? @user.destroy
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

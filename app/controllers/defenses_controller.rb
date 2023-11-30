class DefensesController < BaseController
    before_action :authenticate_user
    before_action :validate_user, only: [:show, :update, :destroy]

    def show
        defense = Defense.find_by(character_id: params[:id])

        if defense.present?
            render json: defense, status: :ok
        else
            render json: false, status: :ok
        end
    end

    def update
        defense = Defense.find_or_initialize_by(character_id: params[:id])

        if defense.update(defense_params)
            render json: defense, status: :ok
        else
            render json: defense.errors, status: :bad_request
        end
    end

    def destroy
        defense = Defense.find_by(character_id: params[:id])

        if defense.destroy
            render status: :ok
        else
            render status: :ok
        end
    end

    private

    def validate_user
        return if current_user.character_id(params[:id]).present?
        
        render status: :unauthorized
    end

    def defense_params
        params.require(:defense)
                .permit(
                    :slot1_name,
                    :slot1_defense,
                    :slot1_penalty,
                    :slot2_name,
                    :slot2_defense,
                    :slot2_penalty,
                    :defense_attribute,
                    :use_attribute,
                    :others
                )
    end
end

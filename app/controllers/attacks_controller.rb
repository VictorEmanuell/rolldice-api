class AttacksController < BaseController
    before_action :authenticate_user, only: [:index, :update, :show, :destroy]
    before_action :set_attack, only: [:update, :show, :destroy]

    def create
        attack = Attack.new(attack_params)

        if attack.save
            render json: attack
        else
            render json: {
              errors: attack.errors
            }, status: :unprocessable_entity
        end
    end

    def index
        attacks = Attack.character_id(params[:character_id])

        render json: attacks
    end

    def show
        if @attack.present?
            render json: @attack, status: :ok
        else
            render status: :bad_request
        end
    end

    def update
        if @attack.present? && @attack.update(attack_params)
            render json: @attack
        else
            render status: :unprocessable_entity
        end
    end

    def destroy
        if (@attack.present? && @attack.destroy)
            render status: :ok
        else
            render status: :bad_request
        end
    end

    private

    def validate_user
        return if current_user.character_id(params[:id]).present?
        
        render status: :unauthorized
    end

    def set_attack
        @attack = Attack.find_by(id: params[:id].to_i)
    end

    def attack_params
        params.require(:attack)
                .permit(
                    :character_id,
                    :name,
                    :attack_bonus,
                    :damage,
                    :extra_damage,
                    :damage_type,
                    :damage_attribute,
                    :extra_dices,
                    :critical_type,
                    :critical_value,
                    :critical_multiplier,
                    :range
                )
    end
end

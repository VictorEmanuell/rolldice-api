class CharacterSkillsController < BaseController
    before_action :authenticate_user

    def update_skill
        character_skill = CharacterSkill
                            .update_character_skill(
                                current_user,
                                params[:character_id],
                                params[:skill_id],
                                character_skill_params
                            )
        
        if character_skill.errors.present?
            render json: character_skill.errors, status: :bad_request
        else
            render json: character_skill, status: :ok
        end
    end

    def show
        render json: CharacterSkill.get_skills(params[:id], session[:user_id])
    end

    private

    def character_skill_params
        params.require(:character_skill)
                .permit(
                    :character_id,
                    :skill_id,
                    :trained,
                    :character_attribute,
                    :others
                )
    end
end

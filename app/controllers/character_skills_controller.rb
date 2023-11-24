class CharacterSkillsController < ApplicationController
    def update_skill
        @character_skill = CharacterSkill.find_by(character_id: params[:character_id], skill_id: params[:skill_id])

        if @character_skill.present?
            @character_skill.update(character_skill_params)
        else
            @character_skill = CharacterSkill.create(character_skill_params)
        end
        
        if @character_skill.errors.present?
            render json: @character_skill.errors, status: :bad_request
        else
            render json: @character_skill, status: :ok
        end
    end

    def show
        render json: CharacterSkill.get_skills(params[:id])
    end

    private

    def character_skill_params
        params.require(:character_skill).permit(:character_id, :skill_id,:trained, :character_attribute, :others)
    end
end

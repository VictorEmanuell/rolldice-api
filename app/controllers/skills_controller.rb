class SkillsController < BaseController
    def index
        skills = Skill.all

        render json: skills, status: :ok
    end
end

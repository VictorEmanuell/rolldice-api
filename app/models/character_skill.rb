class CharacterSkill < ApplicationRecord
    validates :character_id, :skill_id, presence: true

    belongs_to :character
    belongs_to :skill

    def self.get_skills (character_id)
        skills = Skill.all

        skill_array = []

        skills.map do |skill|
            character = skill.character_skill.try(:character)
            
            skill_array << {
                skill: skill,
                modifier: character.try(:id) == character_id.to_i ? skill.character_skill : nil
            }
        end

        skill_array
    end
end

class CharacterSkill < ApplicationRecord
  validates :character_id, :skill_id, presence: true

  belongs_to :character
  belongs_to :skill

  def self.get_skills (character_id, user_id)
    character = Character.find_by(id: character_id)

    character_skills = character.character_skills

    skill_array = []

    character_skills.map do |character_skill|
      skill_array << {
        **character_skill.skill.as_json.symbolize_keys,
        modifier: character.try(:user_id) == user_id &&
          character.try(:id) == character_id.to_i ?
                    character_skill : nil
      }
    end

    skill_array.sort_by { |obj| obj[:name] }
  end

  def self.update_character_skill (current_user, character_id, skill_id, character_skill_params)
    characters = current_user.characters
    character_skill = CharacterSkill
                        .where(character_id: characters.pluck(:id))
                        .find_by(character_id: character_id, skill_id: skill_id)

    if character_skill.present?
      character_skill.update(character_skill_params)
    else
      character_skill = CharacterSkill.create(character_skill_params)
    end

    character_skill
  end
end

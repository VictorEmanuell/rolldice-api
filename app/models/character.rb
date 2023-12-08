class Character < ApplicationRecord
  after_create :create_skills

  belongs_to :user

  has_many :character_skills, dependent: :destroy
  has_many :attacks, dependent: :destroy
  has_one :defense, dependent: :destroy

  scope :user_id, -> (user_id) { where(user_id: user_id) }

  def self.user_id_from_character(user_id, id)
    find_by(user_id: user_id, id: id)
  end

  def create_skills
    skills = Skill.all

    skills.each do |skill|
      CharacterSkill.create(
        character_id: self.id,
        skill_id: skill.id,
        trained: false,
        character_attribute: skill.default_attribute,
        others: 0
      )
    end
  end
end

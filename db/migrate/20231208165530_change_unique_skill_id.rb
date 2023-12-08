class ChangeUniqueSkillId < ActiveRecord::Migration[7.0]
  def change
    change_column :character_skills, :skill_id, :integer, unique: false
  end
end

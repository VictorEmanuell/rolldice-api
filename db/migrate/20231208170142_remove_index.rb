class RemoveIndex < ActiveRecord::Migration[7.0]
  def change
    remove_index :character_skills, :skill_id
  end
end

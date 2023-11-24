class AddIdToCharacterSkills < ActiveRecord::Migration[7.0]
  def change
    add_column :character_skills, :id, :primary_key
  end
end

class Rename < ActiveRecord::Migration[7.0]
  def change
    rename_column :character_skills, :attribute, :character_attribute
  end
end

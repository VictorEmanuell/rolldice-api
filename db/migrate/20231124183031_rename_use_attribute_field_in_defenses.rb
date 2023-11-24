class RenameUseAttributeFieldInDefenses < ActiveRecord::Migration[7.0]
  def change
    rename_column :defenses, :use_atribute, :use_attributes
  end
end

class RenameUseAttributeFieldInDefenses2 < ActiveRecord::Migration[7.0]
  def change
    rename_column :defenses, :use_attributes, :use_attribute
  end
end

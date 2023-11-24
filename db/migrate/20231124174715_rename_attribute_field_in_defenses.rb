class RenameAttributeFieldInDefenses < ActiveRecord::Migration[7.0]
  def change
    rename_column :defenses, :attribute, :defense_attribute
  end
end

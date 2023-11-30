class ChangeDefenseAttributeDefault < ActiveRecord::Migration[7.0]
  def change
    change_column_default :defenses, :defense_attribute, "DES"
  end
end

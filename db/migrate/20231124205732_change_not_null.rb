class ChangeNotNull < ActiveRecord::Migration[7.0]
  def change
    change_column :defenses, :slot1_name, :text, :default => '', :null => true
    change_column :defenses, :slot1_defense, :integer, :default => 0, :null => true
    change_column :defenses, :slot1_penalty, :integer, :default => 0, :null => true
    change_column :defenses, :slot2_name, :text, :default => '', :null => true
    change_column :defenses, :slot2_defense, :integer, :default => 0, :null => true
    change_column :defenses, :slot2_penalty, :integer, :default => 0, :null => true
    change_column :defenses, :use_attribute, :boolean, :default => false, :null => true
    change_column :defenses, :others, :integer, :default => 0, :null => true
  end
end

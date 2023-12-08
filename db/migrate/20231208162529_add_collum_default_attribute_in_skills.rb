class AddCollumDefaultAttributeInSkills < ActiveRecord::Migration[7.0]
  def change
    add_column :skills, :default_attribute, :string
  end
end

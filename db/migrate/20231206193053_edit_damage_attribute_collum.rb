class EditDamageAttributeCollum < ActiveRecord::Migration[7.0]
  def change
    change_column :attacks, :damage_attribute, :string
  end
end

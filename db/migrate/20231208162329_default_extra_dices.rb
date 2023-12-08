class DefaultExtraDices < ActiveRecord::Migration[7.0]
  def change
    change_column :attacks, :extra_dices, :string, default: "0d0"
  end
end

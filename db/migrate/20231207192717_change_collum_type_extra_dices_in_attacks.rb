class ChangeCollumTypeExtraDicesInAttacks < ActiveRecord::Migration[7.0]
  def change
    change_column :attacks, :extra_dices, :string, default: "0"
  end
end

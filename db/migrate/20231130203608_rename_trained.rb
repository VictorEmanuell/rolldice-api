class RenameTrained < ActiveRecord::Migration[7.0]
  def change
    rename_column :skills, :trained, :training
  end
end

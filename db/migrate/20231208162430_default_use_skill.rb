class DefaultUseSkill < ActiveRecord::Migration[7.0]
  def change
    change_column :attacks, :use_skill, :integer, default: 6
  end
end

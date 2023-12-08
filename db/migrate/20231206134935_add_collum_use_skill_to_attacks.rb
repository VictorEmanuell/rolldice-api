class AddCollumUseSkillToAttacks < ActiveRecord::Migration[7.0]
  def change
    add_column :attacks, :use_skill, :integer, default: 0
  end
end

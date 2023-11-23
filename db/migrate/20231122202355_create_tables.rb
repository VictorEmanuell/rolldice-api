class CreateTables < ActiveRecord::Migration[7.0]
  def self.up
    view = File.read(Rails.root.join('db', 'views', "db.sql"))
    execute view
  end
end

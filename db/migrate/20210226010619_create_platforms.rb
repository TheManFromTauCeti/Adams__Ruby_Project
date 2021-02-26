class CreatePlatforms < ActiveRecord::Migration[6.1]
  def change
    create_table :platforms do |t|
      t.string :name
      t.string :description
      t.string :install_base

      t.timestamps
    end
  end
end

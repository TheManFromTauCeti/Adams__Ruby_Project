class CreateDevelopers < ActiveRecord::Migration[6.1]
  def change
    create_table :developers do |t|
      t.string :name
      t.string :description
      t.string :country
      t.string :city

      t.timestamps
    end
  end
end

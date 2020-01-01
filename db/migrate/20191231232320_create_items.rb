class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :price
      t.integer :jan
      t.integer :baika
      t.integer :genka
      t.integer :stock

      t.timestamps
    end
  end
end

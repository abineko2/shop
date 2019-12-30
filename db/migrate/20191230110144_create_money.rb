class CreateMoney < ActiveRecord::Migration[5.1]
  def change
    create_table :money do |t|
      t.date :t_day
      t.integer :uriage
      t.integer :yosan
      t.string :noto

      t.timestamps
    end
  end
end

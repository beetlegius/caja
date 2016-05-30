class CreateMoves < ActiveRecord::Migration[5.0]
  def change
    create_table :moves do |t|
      t.decimal :ammount, precision: 15, scale: 2
      t.string :kind

      t.belongs_to :cash, index: true, foreign_key: true
      t.timestamps
    end
  end
end

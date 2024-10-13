class CreatePieceProductions < ActiveRecord::Migration[7.2]
  def change
    create_table :piece_productions do |t|
      t.references :dice, null: false, foreign_key: true
      t.integer :number_of_pieces

      t.timestamps
    end
  end
end

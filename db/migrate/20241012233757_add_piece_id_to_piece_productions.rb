class AddPieceIdToPieceProductions < ActiveRecord::Migration[7.2]
  def change
    add_reference :piece_productions, :piece, null: false, foreign_key: true
  end
end

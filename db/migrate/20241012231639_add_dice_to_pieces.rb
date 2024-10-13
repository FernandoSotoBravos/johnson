class AddDiceToPieces < ActiveRecord::Migration[7.2]
  def change
    add_reference :pieces, :dice, null: false, foreign_key: true
  end
end

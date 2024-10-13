class CreatePieces < ActiveRecord::Migration[7.2]
  def change
    create_table :pieces do |t|
      t.string :code
      t.integer :strikes

      t.timestamps
    end
  end
end

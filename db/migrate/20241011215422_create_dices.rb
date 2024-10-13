class CreateDices < ActiveRecord::Migration[7.2]
  def change
    create_table :dices do |t|
      t.string :code
      t.integer :max_strikes

      t.timestamps
    end
  end
end

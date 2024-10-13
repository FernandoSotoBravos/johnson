class Dice < ApplicationRecord
    has_one :piece
    has_many :piece_productions
end

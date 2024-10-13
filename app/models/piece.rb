class Piece < ApplicationRecord
    has_many :piece_productions
    belongs_to :dice
end

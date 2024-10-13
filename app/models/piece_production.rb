class PieceProduction < ApplicationRecord
  belongs_to :dice
  belongs_to :piece
end

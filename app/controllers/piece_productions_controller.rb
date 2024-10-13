class PieceProductionsController < ApplicationController
  before_action :set_piece_production, only: %i[ show edit update destroy ]

  # GET /piece_productions or /piece_productions.json
  def index
    @pieces = Piece.all
  end

  # GET /piece_productions/1 or /piece_productions/1.json
  def show
  end

  # GET /piece_productions/new
  def new
    @piece_production = PieceProduction.new
    @piece_production.dice_id = params[:dice_id] if params[:dice_id].present?
    if params[:piece_id].present?
      @piece_production.piece_id = params[:piece_id]
      @piece = Piece.find(@piece_production.piece_id)
    end
  end

  # GET /piece_productions/1/edit
  def edit
  end

  # POST /piece_productions or /piece_productions.json
  def create
    @piece_production = PieceProduction.new(piece_production_params)
    
    piece = Piece.find(@piece_production.piece_id)
    dice = Dice.find(@piece_production.dice_id)
  
    total_strikes_used = PieceProduction.where(dice_id: dice.id)
      .joins(:piece)
      .sum("piece_productions.number_of_pieces * pieces.strikes")
  
    new_strikes = @piece_production.number_of_pieces * piece.strikes
    total_strikes = total_strikes_used + new_strikes
  
    respond_to do |format|
      if @piece_production.save
        if total_strikes < dice.max_strikes
          format.html { redirect_to @piece_production, notice: "Piece production was successfully created." }
          format.json { render :show, status: :created, location: @piece_production }
        else
          format.html { redirect_to @piece_production, 
            notice: "Piece production was successfully created, but the dice has reached its strike limit. Please replace it with a new one." }
          format.json { render json: { message: "Piece production created, but dice limit reached." }, status: :created }
        end
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @piece_production.errors, status: :unprocessable_entity }
      end
    end
  end
  
  

  # PATCH/PUT /piece_productions/1 or /piece_productions/1.json
  def update
    respond_to do |format|
      if @piece_production.update(piece_production_params)
        format.html { redirect_to @piece_production, notice: "Piece production was successfully updated." }
        format.json { render :show, status: :ok, location: @piece_production }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @piece_production.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /piece_productions/1 or /piece_productions/1.json
  def destroy
    @piece_production.destroy!

    respond_to do |format|
      format.html { redirect_to piece_productions_path, status: :see_other, notice: "Piece production was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_piece_production
      @piece_production = PieceProduction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def piece_production_params
      params.require(:piece_production).permit(:dice_id, :piece_id, :number_of_pieces)
    end
end

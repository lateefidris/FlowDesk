class DesksController < ApplicationController
  before_action :set_desk, only: %i[ show edit update destroy ]

  # GET /desks or /desks.json
  def index
    @my_desk = current_user.desks
  end

  # GET /desks/1 or /desks/1.json
  def show
  end

  def store
    @desk = Desk.where('lower(name) = ?', params[:desk_name].downcase).first
    raise ActiveRecord::RecordNotFound unless @desk
  end
  

  # GET /desks/new
  def new
    @desk = Desk.new
  end

  # GET /desks/1/edit
  def edit
  end

  # POST /desks or /desks.json
  def create
    if current_user.desks.present?
      respond_to do |format|
        format.html { redirect_to current_user.desks, alert: "You already have a desk." }
        format.json { render json: { error: "User already has a desk" }, status: :unprocessable_entity }
      end
    else
      @desk = current_user.build_desks(desk_params) 
  
      respond_to do |format|
        if @desk.save
          format.html { redirect_to desk_url(@desk), notice: "Desk was successfully created." }
          format.json { render :show, status: :created, location: @desk }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @desk.errors, status: :unprocessable_entity }
        end
      end
    end
  end
  

  # PATCH/PUT /desks/1 or /desks/1.json
  def update
    respond_to do |format|
      if @desk.update(desk_params)
        format.html { redirect_to desk_url(@desk), notice: "Desk was successfully updated." }
        format.json { render :show, status: :ok, location: @desk }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @desk.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /desks/1 or /desks/1.json
  def destroy
    @desk.destroy

    respond_to do |format|
      format.html { redirect_to desks_url, notice: "Desk was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_desk
      @desk = Desk.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def desk_params
      params.require(:desk).permit(:name, :bio, :location, :profile_picture, :professional_id)
    end
end

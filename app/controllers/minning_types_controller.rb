class MinningTypesController < ApplicationController
  before_action :set_minning_type, only: [:show, :edit, :update, :destroy]

  # GET /minning_types
  # GET /minning_types.json
  def index
    @minning_types = MinningType.all
  end

  # GET /minning_types/1
  # GET /minning_types/1.json
  def show
  end

  # GET /minning_types/new
  def new
    @minning_type = MinningType.new
  end

  # GET /minning_types/1/edit
  def edit
  end

  # POST /minning_types
  # POST /minning_types.json
  def create
    @minning_type = MinningType.new(minning_type_params)

    respond_to do |format|
      if @minning_type.save
        format.html { redirect_to @minning_type, notice: 'Minning type was successfully created.' }
        format.json { render :show, status: :created, location: @minning_type }
      else
        format.html { render :new }
        format.json { render json: @minning_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /minning_types/1
  # PATCH/PUT /minning_types/1.json
  def update
    respond_to do |format|
      if @minning_type.update(minning_type_params)
        format.html { redirect_to @minning_type, notice: 'Minning type was successfully updated.' }
        format.json { render :show, status: :ok, location: @minning_type }
      else
        format.html { render :edit }
        format.json { render json: @minning_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /minning_types/1
  # DELETE /minning_types/1.json
  def destroy
    @minning_type.destroy
    respond_to do |format|
      format.html { redirect_to minning_types_url, notice: 'Minning type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_minning_type
      @minning_type = MinningType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def minning_type_params
      params.require(:minning_type).permit(:description, :acronym)
    end
end

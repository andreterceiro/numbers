class NumsController < ApplicationController
  before_action :set_num, only: %i[ show edit update destroy ]

  # GET /nums or /nums.json
  def index
    @nums = Num.all
  end

  # GET /nums/1 or /nums/1.json
  def show
  end

  # GET /nums/new
  def new
    @num = Num.new
  end

  # GET /nums/1/edit
  def edit
  end

  # POST /nums or /nums.json
  def create
    @num = Num.new(num_params)

    respond_to do |format|
      if @num.save
        format.html { redirect_to @num, notice: "Num was successfully created." }
        format.json { render :show, status: :created, location: @num }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @num.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /nums/1 or /nums/1.json
  def update
    respond_to do |format|
      if @num.update(num_params)
        format.html { redirect_to @num, notice: "Num was successfully updated." }
        format.json { render :show, status: :ok, location: @num }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @num.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nums/1 or /nums/1.json
  def destroy
    @num.destroy
    respond_to do |format|
      format.html { redirect_to nums_url, notice: "Num was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_num
      @num = Num.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def num_params
      params.require(:num).permit(:number)
    end
end

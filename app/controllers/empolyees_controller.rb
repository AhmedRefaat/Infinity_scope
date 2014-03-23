class EmpolyeesController < ApplicationController
  before_action :set_empolyee, only: [:show, :edit, :update, :destroy]

  # GET /empolyees
  # GET /empolyees.json
  def index
    @empolyees = Empolyee.all
  end

  # GET /empolyees/1
  # GET /empolyees/1.json
  def show
  end

  # GET /empolyees/new
  def new
    @empolyee = Empolyee.new
  end

  # GET /empolyees/1/edit
  def edit
  end

  # POST /empolyees
  # POST /empolyees.json
  def create
    @empolyee = Empolyee.new(empolyee_params)

    respond_to do |format|
      if @empolyee.save
        format.html { redirect_to @empolyee, notice: 'Empolyee was successfully created.' }
        format.json { render action: 'show', status: :created, location: @empolyee }
      else
        format.html { render action: 'new' }
        format.json { render json: @empolyee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /empolyees/1
  # PATCH/PUT /empolyees/1.json
  def update
    respond_to do |format|
      if @empolyee.update(empolyee_params)
        format.html { redirect_to @empolyee, notice: 'Empolyee was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @empolyee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /empolyees/1
  # DELETE /empolyees/1.json
  def destroy
    @empolyee.destroy
    respond_to do |format|
      format.html { redirect_to empolyees_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_empolyee
      @empolyee = Empolyee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def empolyee_params
      params.require(:empolyee).permit(:name, :phone, :mobile, :address, :national_id, :mobile_2, :birthday, :age, :role, :salary, :comment)
    end
end

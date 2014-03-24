class GlassesController < ApplicationController
  before_action :set_glass, only: [:show, :edit, :update, :destroy, :addtoshop1]

  # GET /glasses
  # GET /glasses.json
  def index
    @glasses = Glass.all
    #@stores = Store.all(:select => :title)
    @stores = Store.all
  end
  
  #GET /glasses/1/addtoshop
  def addtoshop1
    @stores = Store.all
    @glass = Glass.find(params[:id])
   # @glass_store_link = Glass_store_link.new
    
  end

  # GET /glasses/1
  # GET /glasses/1.json
  def show
  end

  # GET /glasses/new
  def new
    @glass = Glass.new
  end

  # GET /glasses/1/edit
  def edit
  end


  # PATCH/PUT /glasses/1
  # PATCH/PUT /glasses/1.json
  def update
    @glass = glass_params
    #if (@glass.remain_in_store == "")
     # @glass.remain_in_store = @glass.quantity
    #end
    #params[:remain_in_store] = params[:quantity]
    respond_to do |format|
      #if @glass.update(glass_params)
      if @glass.update(@glass)
        #if(@glass.remain_in_store = "")
          
        format.html { redirect_to @glass, notice: 'Glass was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @glass.errors, status: :unprocessable_entity }
      end
    end
  end



  # POST /glasses
  # POST /glasses.json
  def create
    @glass = Glass.new(glass_params)
    if(@glass.remain_in_store=="")
      @glass.remain_in_store = @glass.quantity
    end

    respond_to do |format|
      if @glass.save
        format.html { redirect_to @glass, notice: 'Glass was successfully created.' }
        format.json { render action: 'show', status: :created, location: @glass }
      else
        format.html { render action: 'new' }
        format.json { render json: @glass.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /glasses/1
  # DELETE /glasses/1.json
  def destroy
    @glass.destroy
    respond_to do |format|
      format.html { redirect_to glasses_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_glass
      @glass = Glass.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def glass_params
      params.require(:glass).permit(:frame_kind, :made_in, :quantity, :remain_in_store, :unity_price, :discount_rate, :glass_kind, :discount_rate_2, :model, :available_color, :sold, :frame_material)
    end
    def country
    [
      ['Turkey', 'Tur'],
      ['Japan', 'Jap'],
      ['Koera', 'Koe'],
      ['China', 'ARE'],
      ['Italy', 'IT'],
      ['German', 'GRM'],
      ['France', 'FR']
    ]
end
end

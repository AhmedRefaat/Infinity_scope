class GlassStoreLinksController < ApplicationController
  before_action :set_glass_store_link, only: [:show, :edit, :update, :destroy, :addtoshop]
  @@action_method = 0
  @@stores = Store.all
  @@links_errors = []

  # GET /glass_store_links
  # GET /glass_store_links.json
  def index
    @glass_store_links = GlassStoreLink.all
    @glass_store_links.each do |glass_store_link|
      @glass = Glass.find(glass_store_link.glass_id)
    end
  end

  # GET /glass_store_links/1
  # GET /glass_store_links/1.json
  def show
  end
  
  def new2
    @@action_method = 2
    @glass_store_link = GlassStoreLink.new
    @glass_store_link.glass_id = params[:glass_id]
    @glass = Glass.find(params[:glass_id])
    @stores = Store.all
    #if(@@links_errors.length > 0)
     # @glass_store_link.errors= @@links_errors
    #end
  end

  # GET /glass_store_links/new
  def new
    @@action_method = 1
    @glass_store_link = GlassStoreLink.new
    @glass_store_link.glass_id = params[:glass_id]
    @glass = Glass.find(params[:glass_id])
    @stores = @@stores
  end

  # GET /glass_store_links/1/edit
  def edit
  end

  # POST /glass_store_links
  # POST /glass_store_links.json
  def create
    @glass_store_link = GlassStoreLink.new(glass_store_link_params)
    @stores = Store.all
    #@glass_store_link.glass_id = params[:glass_id]
    @glass = Glass.find_by_id(params[:glass_id])
    @glass_store_link2 = @glass_store_link.is_unique_for_same_glass_kind(@glass_store_link.store_id, @glass_store_link.glass_id)
    if(@glass_store_link2)
      @glass_store_link2.quantity = @glass_store_link2.quantity+ @glass_store_link.quantity
      @glass_store_link = @glass_store_link2
    end

    respond_to do |format|
      if @glass_store_link.save
        format.html { redirect_to @glass_store_link, notice: 'Glass store link was successfully created.' }
        format.json { render action: 'show', status: :created, location: @glass_store_link }
      else
        if (@@action_method==1)
          format.html { render action: 'new' }
        elsif(@@action_method==2)
          format.html { redirect_to :action=>'new2', :glass_id=> @glass_store_link.glass_id  }
        end
        flash[:errors] = @glass_store_link.errors.empty? ? "Error" : @glass_store_link.errors.full_messages
        @@links_errors = @glass_store_link.errors
        format.json { render json: @glass_store_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /glass_store_links/1
  # PATCH/PUT /glass_store_links/1.json
  def update
    respond_to do |format|
      if @glass_store_link.update(glass_store_link_params)
        format.html { redirect_to @glass_store_link, notice: 'Glass store link was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @glass_store_link.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /glass_store_links/1
  # DELETE /glass_store_links/1.json
  def destroy
    @glass_store_link.destroy
    respond_to do |format|
      format.html { redirect_to glass_store_links_url }
      format.json { head :no_content }
    end
  end
  
  def addtoshop
    @current_shops = STORE.all
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_glass_store_link
      @glass_store_link = GlassStoreLink.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def glass_store_link_params
      params.require(:glass_store_link).permit(:glass_id, :store_id, :quantity)
    end
end

class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]
  @@current_glasses = Glass.all
  
def glass_to_String
      @req_string = []
      @all_glasses = Glass.all
      Glass.all.each do |glass|
        @req_string += [glass.frame_kind + ' - '+ glass.frame_material.to_s+' - '+ glass.made_in.to_s + ' - ' + glass.available_color.to_s + ' - ' + glass.model.to_s]
      end 
      return @req_string
    end
    private
     def  set_customer
      @customer = Customer.find(params[:id])
    end

     # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:name, :phone, :delivery_date, :work, :mobile, :address, :request_date, :cash, :paid, :remained, :lft_sp, :lft_cl, :lft_ax, :rght_sp, :rght_cl, :rght_ax, :doctor, :req_store, :deliv_store, :comment, :delivered)
    end

  public
    
  # GET /customers
  # GET /customers.json
  def index
    @customers = Customer.all
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
    
  end

  # GET /customers/new
  def new
    @customer = Customer.new
    @glasses = Glass.all
    @stores = Store.all
    @strings = glass_to_String()
  end

  # GET /customers/1/edit
  def edit
    @glasses = Glass.all
    @stores = Store.all
    @strings = glass_to_String()
    @customer = Customer.find(params[:id])
        #set remained in case not added by user 
    #set remained in case not added by user 
    if (@customer.remained == "")
       @customer.remained = @customer.cash - @customer.paid
     elsif ((@customer.cash - @customer.paid) != @customer.remained)
       @customer.remained = @customer.cash - @customer.paid
    end   # end of checking user remained amount of money
    
    
  end
  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update


    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end
  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(customer_params)
    
    #set remained in case not added by user 
    if (@customer.remained == "")
       @customer.remained = @customer.cash - @customer.paid
     elsif ((@customer.cash - @customer.paid) != @customer.remained)
       @customer.remained = @customer.cash - @customer.paid
    end   # end of checking user remained amount of money
    
    if(@customer.deliv_store = "")
      @customer.deliv_store = @customer.req_store
    

    respond_to do |format|
      if @customer.save
        format.html { redirect_to @customer, notice: 'Customer was successfully created.' }
        format.json { render action: 'show', status: :created, location: @customer }
      else
        format.html { render action: 'new' }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end
  
  


  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url }
      format.json { head :no_content }
    end
  end
  
  
    
  #private
    # Use callbacks to share common setup or constraints between actions.

    # Never trust parameters from the scary internet, only allow the white list through.
    #def customer_params
     # params.require(:customer).permit(:name, :phone, :delivery_date, :work, :mobile, :address, :request_date, :cash, :paid, :remained, :lft_sp, :lft_cl, :lft_ax, :rght_sp, :rght_cl, :rght_ax, :doctor, :req_store, :deliv_store, :comment)
    #end
    

end
end
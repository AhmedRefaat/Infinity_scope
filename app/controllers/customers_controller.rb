class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]
  
  #static variable declaration : 
  @@current_glasses = Glass.all
  @@glasses_hash = {}
  @@current_customer = 1
  @@req_customers = []
  #end of static variables declarations
  
def glass_to_String
      @req_string = []
      for glass in Glass.all
        if glass.quantity > 0
          @@glasses_hash[glass.id] = glass.frame_kind.to_s + ' - '+ glass.frame_material.to_s+' - '+ glass.made_in.to_s + ' - ' + glass.available_color.to_s + ' - ' + glass.model.to_s
          @req_string += [(glass.frame_kind.to_s + ' - '+ glass.frame_material.to_s+' - '+ glass.made_in.to_s + ' - ' + glass.available_color.to_s + ' - ' + glass.model.to_s )] 
        end
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
    @customers = Customer.search(params[:search])
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
    
  end

  # GET /customers/new
  def new
    @customer = Customer.new
    @@current_customer = @customer.id
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
    @@current_customer = @customer.id
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
        @@current_customer = @customer.id
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
    
    #checking which store that customer asked to take the glass from
    if(@customer.deliv_store = "")
      @customer.deliv_store = @customer.req_store
    end

    respond_to do |format|
      if @customer.save
        @@current_customer = @customer.id
        format.html { redirect_to customers_select_glass_path, notice: 'Customer was successfully created.' }
        format.json { render action: 'show', status: :created, location: @customer }
      else
        format.html { render action: 'new' }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end
  
  
  def select_glass  
    @glasses = Glass.all
    if params[:customer_id]
      @customer = Customer.find(params[:customer_id])
    else
      @customer = Customer.find(@@current_customer)
    end
    #@customer = Customer.find(@@current_customer)
  end
  
  def select_glass_to_old_customer
    @glasses = Glass.all
    @customer = Customer.find(params[:customer_id])
    #@customer = @@req_customers
  end
  
  def find_customer #unused action now 
    @customer= []
    if (params[:name_option] == true)
      name_keyward = "%"+params[:req_name]+"%"
      @customer += Customer.find(:all, :conditions => ['name LIKE ?', name_keyward])
    elsif (params[:mobile_option] == true)
      mobile_keyword = "%"+ params[:req_mobile] + "%"
      @customer += Customer.find(:all, :conditions => ['mobile LIKE ?', mobile_keyward])
    end
    show_notice = @customer.length.to_s + " were found"
    @@req_customers = @customer
  #  respond_to do |format|
     # format.html {redirect_to customers_select_glass_to_old_customer_path, notice: show_notice}
    #end 
  end
  
  def found_customers
    @customers = Customer.search(params[:search])
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

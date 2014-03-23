class GlassStoreLink < ActiveRecord::Base
  belongs_to :glass
  belongs_to :store
  validates_presence_of :store_id, :message => "Please select the Shop"
  validates_presence_of :quantity,  :message => "Please Enter the required quantity"
  validate :quantity, :inside_valid_range
  #validate :store_id, :is_unique_for_same_glass_kind
  
      def is_unique_for_same_glass_kind (store_id, glass_id)
      @current_link = []
      if store_id
        #@store_links = Glass_store_link.find_by_store_id(store_id)
        @store_links = GlassStoreLink.find_all_by_store_id(store_id)
        if @store_links  
        @store_links.each do |store|
          @store_glass = Glass.find_by_id(store.glass_id)
          if @store_glass.id == glass_id
            return store
          end
        end
        end
      end
        return
    end
  
  private 
    def inside_valid_range
      if quantity        
      @glass = Glass.find_by_id(glass_id)
      #logger.debug  'got glass id : ' + :glass_id
      if(quantity < @glass.remain_in_store)
        @glass.remain_in_store = @glass.remain_in_store - quantity
        @glass.save
        return true
      else
        errors.add(:base, 'Please enter quantity less than ' + @glass.quantity.to_s)
      end
    end
    end
end

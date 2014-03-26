class Customer < ActiveRecord::Base
  has_many :line_items, dependent: :destroy
  
  
  def self.search(search)
    if search
      find(:all, :conditions=> ['name LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end
  
end

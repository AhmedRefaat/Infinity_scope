class Glass < ActiveRecord::Base
  has_many :glass_store_links, dependent: :destroy
  
  before_destroy :ensure_not_referenced_by_any_glass_store_link
  
  
  private
  #ensure that there are no glass_store_links referencing for this glass type
  def ensure_not_referenced_by_any_glass_store_link
    if glass_store_links.empty?
      return true
    else
      errors.add(:base, 'There a store that contains some glass from this type')
      return false
    end
  end
end

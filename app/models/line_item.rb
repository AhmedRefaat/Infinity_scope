class LineItem < ActiveRecord::Base
  belongs_to :glass
  belongs_to :customer
end

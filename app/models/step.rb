class Step < ActiveRecord::Base
  has_many   :notes
  belongs_to :recipe
end

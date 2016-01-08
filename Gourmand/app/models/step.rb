class Step < ActiveRecord::Base
  belongs_to :note
  belongs_to :recipe
end

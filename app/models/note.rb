class Note < ActiveRecord::Base
  belongs_to :user
  belongs_to :recipe
  belongs_to :step
end

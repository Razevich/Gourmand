class Step < ActiveRecord::Base
  has_many   :notes, dependent: :destroy
  belongs_to :recipe
end

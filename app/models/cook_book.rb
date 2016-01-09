class CookBook < ActiveRecord::Base
  belongs_to :kitchen
  has_many :recipes, dependent: :destroy

end

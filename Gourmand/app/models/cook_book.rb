class CookBook < ActiveRecord::Base
  belongs_to :user
  belongs_to :kitchen
  has_many :recipes

end

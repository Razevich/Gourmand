class UsersKitchen < ActiveRecord::Base
  belongs_to :user
  belongs_to :kitchen
end

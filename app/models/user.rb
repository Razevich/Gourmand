require 'securerandom'

class User < ActiveRecord::Base
  has_many :recipes
  has_many :notes
  has_many :users_kitchens
  has_many :kitchens, through: :users_kitchens
  has_secure_password
  before_create :set_auth_token

  private
    def set_auth_token
      return if token.present?
      self.token = generate_auth_token
    end

    def generate_auth_token
      SecureRandom.uuid.gsub(/\-/,'')
    end
end

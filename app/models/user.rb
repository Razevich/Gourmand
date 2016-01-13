require 'securerandom'

class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates_format_of :email, :with => /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/

  has_many :recipes
  has_many :notes
  has_many :users_kitchens
  has_many :kitchens, through: :users_kitchens
  has_secure_password
  before_create :set_auth_token

    def self.search(query)
      # where(:title, query) -> This would return an exact match of the query
      where("username like ?", "%#{query}%")
    end

  private
    def set_auth_token
      return if token.present?
      self.token = generate_auth_token
    end

    def generate_auth_token
      SecureRandom.uuid.gsub(/\-/,'')
    end
end

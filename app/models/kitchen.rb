class Kitchen < ActiveRecord::Base
  has_many :users_kitchens
  has_many :users, through: :users_kitchens
  has_many :shopping_lists, dependent: :destroy
  has_many :cook_books, dependent: :destroy
  belongs_to :creator, class_name: "User"
  after_save :add_shopping_list, :add_cook_book

  def index
    if params[:search]
      @kitchens = Kitchen.search(params[:search]).order("created_at DESC")
    else
      @kitchens = []
    end
  end

  def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("name like ?", "%#{query}%")
    render :json => {kitchens: @kitchens}
  end

  def add_shopping_list
    self.shopping_lists.create(kitchen_id: self.id)
  end

  def add_cook_book
    self.cook_books.create(kitchen_id: self.id)
  end

  def recipe_names
    array = []
    self.cook_books.first.recipes.each do |recipe|
      array << recipe.name
    end
    return array
  end

  def recipe_ids
    array = []
    self.cook_books.first.recipes.each do |recipe|
      array << recipe.id
    end
    return array
  end

  def user_names
    array = []
    self.users.each do |user|
      array << user.names
    end
    return array
  end

  def to_table
    Hash[self.cook_books.first.recipes.map{|recipe| [recipe.id, recipe.name]}]
    # array = self.recipe_ids.zip(self.recipe_names)
    # hash = Hash[array.map {|key, value| [key, value]}]
    # return hash
  end

  # def as_json(opts={})
  #   {
  #     foo: "bar"
  #   }
  # end

  def convert_table(ids, names)
    # array = []
    # counter = 1
    #   until counter == data.length
    #     array << data[0].zip(data[counter])
    #     counter += 1
    #   end
    array = ids.zip(names)
    #take an array of 2 values, an id and a name. Convert that into a hash with key id => value name
    hash = Hash[array.map {|key, value| [key, value]}]
    return hash
  end
end

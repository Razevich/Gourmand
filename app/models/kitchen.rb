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

  def self.convert_table(data)
    array = []
    counter = 1
      until counter == data.length
        array << data[0].zip(data[counter])
        counter +=1
      end

    array.each do |i|
      i = Hash[i.map {|key, value| [key, value]}]
    end
    return i
  end

end

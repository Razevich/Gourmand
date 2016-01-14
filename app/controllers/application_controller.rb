class ApplicationController < ActionController::Base
  def current_user
    @current_user ||  = User.find_by(token: params[:token])
  end

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

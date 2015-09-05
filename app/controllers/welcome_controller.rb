class WelcomeController < ApplicationController
  def index
  end

  # POST 'ajax/get_fb_data'
  def first_page
    self_data = params[:self]
    friends_data = params[:friends]

    friends_names = []
    friends_data.each do |key,friend|
      friends_names.push(friend["name"])
    end

    output = {:self => self_data, :friends => friends_names}
    puts output

    respond_to do |format|
      format.json {render :json => output}
    end
  end

end

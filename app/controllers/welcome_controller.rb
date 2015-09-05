class WelcomeController < ApplicationController
  def index
  end

  # GET '/process_user_info'
  def process_user_info
    
  end

  # POST 'ajax/get_fb_data'
  def first_page
    self_data = params[:self]
    #friends_data = params[:friends]

    # friends_ids = []
    # friends_names = []
    # friends_data.each do |key,friend|
    #   friends_ids.push(friend["id"])
    #   friends_names.push(friend["name"])
    # end

    #output = {:self => self_data, :friends => friends_ids}

    if !User.find_by(facebookid:self_data["id"])
      render :js => "window.location = '/process_user_info'"
    else
      main_page(self_data["id"],self_data["id"])
    end
  end

  def main_page(login_id,view_id)

  end

end

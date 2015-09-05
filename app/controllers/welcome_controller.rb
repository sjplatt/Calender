class WelcomeController < ApplicationController
  def index
  end

  def add_to_database
    self_data = params[:self]
    friends_data = params[:friends]
    
    friends_ids = []
    friends_data.each do |key,friend|
      friends_ids.push(friend["id"])
    end
    categories = params[:categories]
    relationship = params[:relationship]

    name = self_data["name"]
    gender = self_data["gender"]
    id = self_data["id"]
    picture = self_data["picture"]["data"]["url"]
    link = self_data["link"]

    user = User.create(name:name, gender:gender, facebookid:id,fblink:link,
      picture:picture,categories:categories.to_s)

    relationship.each do |key,value|
      friend = User.find_by(facebookid:key)

      user.relationships.create(type:value,users_id:friend.id)
      #HERE WE SEND A NOTIFICATION TO friend SO THAT HE WILL CLASSIFY
      #user
      friend.relationships.create(type:value,users_id:user.id)
    end
    redirect_to action: main_page, login_id:id, view_id:id
  end

  def process_user_info()
    
  end

  # POST 'ajax/get_fb_data'
  def first_page
    self_data = params[:self]
    id = self_data["id"]

    if !User.find_by(facebookid:id)
      render :js => "window.location = '/process_user_info'"
      return
    end

    render :js => 
      "window.location = '/main_page/?login_id=#{id}&view_id=#{id}'"
    return
  end

  def main_page
    login_id = params["login_id"]
    view_id = params["view_id"]
  end

end

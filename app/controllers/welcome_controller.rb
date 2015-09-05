require 'yaml'
class WelcomeController < ApplicationController
  def index
  end

  # TODO add route
  def add_to_database
    self_data = params[:self]
    friends_data = params[:friends]
    categories = params[:categories]
    relationship = params[:relationship]
    puts relationship.to_s
    puts "@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
    friends_ids = friends_data
      
    name = self_data["name"]
    gender = self_data["gender"]
    id = self_data["id"]
    picture = self_data["picture"]["data"]["url"]
    link = self_data["link"]

    if !User.find_by(facebookid:self_data["id"])

      user = User.create(name:name, gender:gender, facebookid:id,fblink:link,
        picture:picture,categories:categories.to_s)

      if relationship
        relationship.each do |key,value|
          friend = User.find_by(facebookid:key)
          puts key
          value.each do |val|
            puts "SUP@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
            user.relationships.create(reltype:val)
            #HERE WE SEND A NOTIFICATION TO friend SO THAT HE WILL CLASSIFY
            #user
            friend.relationships.create(reltype:val)
          end
        end
      end
    end
    render :js => 
      "window.location = '/main_page/?login_id=#{id}&view_id=#{id}'"
    return 
  end

  def process_user_info()
    
  end

  # POST /ajax/create_event
  def create_event
    event = params[:eventObj]
    name = event[:name]
    startend = event[:startend]
    title = event[:title]
    url = event[:url]
    id = params[:login_id]
    
    user = User.find_by(facebookid:id)

    #user.events.create(name:name,datetime:startend,website:url,)
    respond_to do |format|
      format.json {render :json => {:event => event}}
    end
  end

  # POST 'ajax/get_preliminary_data'
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
    login_id = params[:login_id]
    view_id = params[:view_id]

    if login_id == view_id
      @user = User.find_by(facebookid:login_id)
      @categories = YAML.load(@user.categories)

      @events = @user.events

      @friends = []
      @user.relationships.each do |relat|
        @friends<<User.find_by(id:relat.users_id)
      end
    else
      @user = User.find_by(facebookid:view_id)
      curuser = User.find_by(facebookid:login_id)

      @categories = ["Everyone"]
      @friends = []

      @user.relationships.each do |relat|
        @friends<<User.find_by(id:relat.users_id)
        if relat.user_id == curuser.id
          @categories<<relat.type
        end
      end
      events = @user.events
      @events = []
      if events
        events.each do |even|
          if @categories.include?(even.hostclass)
            @events<<even
          end
          if even
            even.users.each do |user_of_event|
              if user_of_event.facebookid == login_id && !@events.contains?(even)
                @events<<even
              end
            end
          end
        end
      end
    end
  end

end

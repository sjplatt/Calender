class WelcomeController < ApplicationController
  def index
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

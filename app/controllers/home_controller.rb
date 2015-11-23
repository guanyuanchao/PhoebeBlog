class HomeController < ApplicationController
  before_filter :authenticate_user!
  def index

  end

  def upload_photo
    msg = "faild"
    user = User.find(current_user.id)
    user.photo = params[:photo_data]
    msg = "success" if user.save
    render json: {:success=>true, :msg=> msg }
  end
end

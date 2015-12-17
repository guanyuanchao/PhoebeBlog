class HomeController < ApplicationController
  before_filter :authenticate_user!
  def index
      @articles =  current_user.articles.paginate(:page  =>  params[:page], :per_page =>  5)
      photo = redis.get(current_user.id.to_s)
      if photo.to_s != ""
        @photo = photo
      else
        @photo = current_user.photo
        redis.set(current_user.id.to_s, current_user.photo, ex: 600)
      end
  end

  def upload_photo
    msg = "faild"
    user = User.find(current_user.id)
    user.photo = params[:photo_data]
    msg = "success" if user.save
    render json: {:success=>true, :msg=> msg }
  end
end

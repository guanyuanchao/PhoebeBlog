class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  $ARTICLE_TYPE = {
  	I18n.t("emotion") => 1,
  	I18n.t("travel") => 2,
  	I18n.t("life") => 3
  }
  $ARTICLE_TYPE_REVERT = {
  	1 => I18n.t("emotion"),
  	2 => I18n.t("travel"),
  	3 => I18n.t("life")
  }

  def redis
    $redis
  end
end

class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @overtimeinfo = current_user.overtimeinfos.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end
end

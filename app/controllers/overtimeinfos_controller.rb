class OvertimeinfosController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
    @overtimeinfo = current_user.overtimeinfos.build(overtimeinfo_params)
    if @overtimeinfo.save
      flash[:success] = "登録されました。"
      redirect_to root_url
    else
      @feed_items = current_user.feed.paginate(page: params[:page])
      render 'static_pages/home'
    end
  end

  def destroy
    @overtimeinfo.destroy
    flash[:success] = "削除しました。"
    redirect_to request.referrer || root_url
  end
  
  private

    def overtimeinfo_params
      params.require(:overtimeinfo).permit(:created_at, :overtime, :extratime)
    end
    
    def correct_user
      @overtimeinfo = current_user.overtimeinfos.find_by(id: params[:id])
      redirect_to root_url if @overtimeinfo.nil?
    end
end

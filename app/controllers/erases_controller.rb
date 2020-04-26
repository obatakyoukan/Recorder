class ErasesController < ApplicationController
  def destroy
    @user = current_user
    @user.destroy
    session.delete(:user_id)
    flash.alert = "削除しました."
    redirect_to :root
  end
end

class ApplicationController < ActionController::Base
  before_action :ensure_session
  
  protected
  def after_sign_in_path_for(resource)
    session.delete(:return_to) || root_path
  end

  private

  def ensure_session
    session[:session_id] ||= SecureRandom.hex(10) # セッションIDがなければ生成
  end
end

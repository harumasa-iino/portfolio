class ApplicationController < ActionController::Base
  before_action :ensure_session

  private

  def ensure_session
    session[:session_id] ||= SecureRandom.hex(10) # セッションIDがなければ生成
  end
  
end

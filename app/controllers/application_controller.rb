class ApplicationController < ActionController::Base
  before_action :ensure_session

  private

  def ensure_session
    session[:session_id] ||= SecureRandom.hex(10) # セッションIDがなければ生成
  end

  # Answeに追加
#  def create
#    @answer = Answer.new(answer_params)
#    @answer.session_id = session[:session_id]  # セッションIDをAnswerレコードに保存
#    if @answer.save
#    else
#    end
#  end
end

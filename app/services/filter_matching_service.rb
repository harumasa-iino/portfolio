class FilterMatchingService
    def initialize(session_id)
      @session_id = session_id
    end
  
    def match_posters
      # フィルター条件に基づいてポスターを選択するロジック
      user_result = UserResult.where(session_id: @session_id).order(created_at: :desc).first
      return [] unless user_result
  
      matched_posters = Poster.joins(:poster_results).where(poster_results: { category_id: user_result.category_id })
    end
  end
  
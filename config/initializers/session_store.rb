Rails.application.config.session_store :cookie_store, key: '_user_id_session', expire_after: 1.month
# session期限を1ヶ月に設定

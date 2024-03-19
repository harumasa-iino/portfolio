class SnsCredential < ApplicationRecord
  belongs_to :user
  validates :provider, :uid, :user_id, presence: true
end

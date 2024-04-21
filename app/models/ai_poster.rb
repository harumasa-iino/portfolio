class AiPoster < ApplicationRecord
  mount_uploader :image, AiImageUploader
  validates :image, :revised_prompt, presence: true
  attr_accessor :remote_image_url

  def save_image_and_data(image_url, revised_prompt, session_id)
    self.remote_image_url = image_url
    download_remote_image
    self.revised_prompt = revised_prompt
    self.session_id = session_id
    save!
  rescue CarrierWave::DownloadError => e
    errors.add(:image, "Failed to download image: #{e.message}")
    false
  end

  private

  def download_remote_image
    return if remote_image_url.blank?
    image.download_remote_file(remote_image_url)
    self.remote_image_url = nil
  end
end
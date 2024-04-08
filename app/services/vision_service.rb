# app/services/vision_service.rb
require "google/cloud/vision"

class VisionService
  def self.detect_colors(image_path)
    vision = Google::Cloud::Vision.image_annotator do |config|
      config.credentials = ENV["GOOGLE_CLOUD_KEYFILE_JSON"]
    end
    
    response = vision.image_properties_detection image: image_path
    colors = response.responses.first.image_properties_annotation.dominant_colors.colors
    colors.map do |color|
      {
        hex: to_hex(color.color),
        rgb: "#{color.color.red},#{color.color.green},#{color.color.blue}",
        pixel_fraction: color.pixel_fraction
      }
    end
  end

  def self.to_hex(color)
    "#" + [color.red, color.green, color.blue].map do |c|
      c.round.to_s(16).rjust(2, '0')
    end.join
  end
end

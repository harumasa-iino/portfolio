class ColorMatchingService
    def initialize(room_id)
      @room = Room.find(room_id)
    end
  
    def match_posters
      room_colors = @room.colors
      posters = Poster.includes(:colors)
      matched_posters = []
  
      posters.each do |poster|
        total_score = calculate_match_score(room_colors, poster.colors)
        matched_posters << { poster: poster, score: total_score } if total_score > 50
      end
  
      matched_posters.sort_by { |mp| -mp[:score] }
    end
  
    private
  
    def calculate_match_score(room_colors, poster_colors)
      room_colors.sum do |room_color|
        poster_colors.sum do |poster_color|
          room_hue = ColorConversion.rgb_to_hue(*ColorConversion.hex_to_rgb(room_color.hex))
          poster_hue = ColorConversion.rgb_to_hue(*ColorConversion.hex_to_rgb(poster_color.hex))
          ColorMatching.harmony_score(room_hue, poster_hue) * room_color.pixel_fraction
        end
      end
    end
  end
  
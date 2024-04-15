class ColorMatchingService
    def initialize(room_id)
      @room = Room.find(room_id)
    end
  
    def match_posters
      room_colors = RoomColor.includes(:color).where(room_id: @room.id)
      posters = Poster.includes(poster_colors: :color)
      matched_posters = []
  
      posters.each do |poster|
        total_score = calculate_match_score(room_colors, poster.poster_colors)
        matched_posters << { poster: poster, score: total_score } if total_score > 50
      end
  
      matched_posters.sort_by { |mp| -mp[:score] }
    end
  
    private
  
    def calculate_match_score(room_colors, poster_colors)
      room_colors.sum do |room_color|
        poster_colors.sum do |poster_color|
          room_hue = ColorTools::Conversion.rgb_to_hue(*ColorTools::Conversion.hex_to_rgb(room_color.color.hex))
          poster_hue = ColorTools::Conversion.rgb_to_hue(*ColorTools::Conversion.hex_to_rgb(poster_color.color.hex))
          ColorTools::Matching.harmony_score(room_hue, poster_hue) * room_color.pixel_fraction
        end
      end
    end
  end
  
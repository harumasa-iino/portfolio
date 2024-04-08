module ColorTools
  module Conversion
    def self.hex_to_rgb(hex)
      hex = hex.gsub('#', '')
      hex.scan(/../).map(&:hex)
    end
  
    def self.rgb_to_hue(r, g, b)
      r /= 255.0
      g /= 255.0
      b /= 255.0
      max = [r, g, b].max
      min = [r, g, b].min
      delta = max - min
  
      return 0 if delta == 0

      hue = case max
            when r
              (g - b) / delta % 6 * 60
            when g
              (b - r) / delta + 2 * 60
            when b
              (r - g) / delta + 4 * 60
            end
  
      hue.negative? ? hue + 360 : hue
    end
  end
end  
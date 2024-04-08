module Color
  module ColorMatching
    def self.harmony_score(hue1, hue2)
      diff = (hue1 - hue2).abs % 360
      diff = 360 - diff if diff > 180
  
      case diff
      when 0..30
        80  # 類似色
      when 150..210
        100  # 補色
      when 110..130
        60  # 三角形の関係
      else
        0   # その他
      end
    end
  end
end
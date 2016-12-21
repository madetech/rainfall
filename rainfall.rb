class Rainfall
  def calculate(heights)
    volumes = []
    heights.each_with_index do |height, i|
      left_max = heights[0..i].max
      right_max = heights[i..-1].max

      top = [left_max, right_max].min

      if top > height && i != 0 && i != (heights.length - 1)
        volumes << top - height
      end
    end

    volumes.reduce(0) do |sum, volume|
      sum + volume
    end
  end
end

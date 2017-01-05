class Rainfall
  def calculate(heights)
    area = 0

    heights.each_with_index do |height, i|
      if heights[i-1] > height && heights[i+1] > height
        area += 1 unless heights[i-1].nil? || heights[i+1].nil?
      end
    end

    area
  end
end

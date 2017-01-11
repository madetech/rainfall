class Rainfall
  def calculate(heights)
    @total_area = 0

    heights.each_with_index do |v, i|
      max = heights[0..i].max
      right_hand_max = heights[i..-1].max

      lowest_wall = [max, right_hand_max].min

      @total_area += lowest_wall - v
    end

    @total_area
  end
end

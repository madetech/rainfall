class Rainfall
  def calculate(heights)
    @total_area = 0

    heights.inject do |v, i|
      max = get_max(heights)
      right_hand_max = right_hand_max(heights)

      lowest_wall = [max, right_hand_max].min

      @total_area += lowest_wall - v
    end
  end

  private

  def right_hand_max(heights)
    heights[i..-1].max
  end

  def get_max(heights)
    max = heights[0..i].max
  end

  def lowest
end

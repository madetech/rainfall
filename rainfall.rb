class Rainfall
  def calculate(heights)
    return 0 if heights.size == 2
    if heights.size == 3
      left_wall = heights.first
      right_wall = heights.last

      left_wall_index = heights.index(left_wall)
      right_wall_index = heights.rindex(right_wall)

      calculate_puddle(left_wall, right_wall, left_wall_index, right_wall_index, heights)
    end
  end

  def calculate_puddle(left_wall, right_wall, left_wall_index, right_wall_index, heights)
    length = (right_wall_index) - (left_wall_index)
    puts length
    highest = [left_wall, right_wall].max
    puts highest

    raw_volume = length * highest
    puts raw_volume
    rainfall = heights[(left_wall_index + 1)..(right_wall_index -1)].reduce(:+)

    raw_volume - rainfall
  end
end

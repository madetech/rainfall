class Rainfall
  def calculate(heights)
    test = [2,5,1,2,3,4,7,7,6]

    last_point = 0
    lower_points = []
    searching_for_pond = false
    overall_pond_size = 0

    # 6, 7, 7, 4, 3, 2, 1, 5, 2
    heights.each do |t|
      if t >= last_point
        if searching_for_pond == true
          overall_pond_size += size_of_pond(lower_points, last_point)
          searching_for_pond = false
          last_point = t
          lower_points.pop
        else
          searching_for_pond = false
          last_point = t
        end
      elsif t < last_point
        searching_for_pond = true
        lower_points << t
      end

      overall_pond_size += size_of_pond(lower_points, last_point)
      lower_points.pop


      # p "heights = #{heights}"
      # p "last_point = #{last_point}"
      # p "lower_points = #{lower_points}"
      # p "searching_for_pond = #{searching_for_pond}"
      # p "overall_pond_size = #{overall_pond_size}"
    end

    overall_pond_size
  end

  def size_of_pond(lower_points, lower_wall_point)
    entire_square_volume = lower_wall_point * lower_points.count
    entire_square_volume - lower_points.inject(:+)
  end
end

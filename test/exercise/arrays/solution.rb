module Exercise
  module Arrays
    class << self
      def replace(array)
        max = find_max(array)
        array.map { |i| i < max && i >= 0 ? max : i }
      end

      def search(array, query)
        return -1 if array.empty?
        left_index = 0
        right_index = array.length - 1
        mid_index = right_index / 2

        while left_index <= right_index
          guess = array[mid_index]
          return mid_index if query == guess

          if query > guess
            left_index = mid_index + 1
          elsif query < guess
            right_index = mid_index - 1
          end

          mid_index = (right_index + left_index) / 2
        end

        -1
      end

      def find_max(array)
        return nil if array.empty?
        max = array[0]
        for i in array
          max = i if i > max
        end
        max
      end
    end
  end
end

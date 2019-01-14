module Exercise
  module Arrays
    class << self
      def replace(array)
        max = findMax(array)
        array.map { |i| i < max && i >= 0 ? max : i }
      end
 
      def search(array, query)
        return -1 if array.empty?
        left_index = 0
        right_index = array.length - 1
        mid_index = right_index / 2

        while left_index <= right_index do
          guess = array[mid_index]
          return mid_index if query == guess

          if query > guess
            left_index = mid_index + 1
          elsif query < guess
            right_index = mid_index - 1
          end

          mid_index = (right_index + left_index) / 2
        end

        return -1
      end

      def quickSort(array)
        return array if array.length < 2
        pivot = array[0]
        less = array.select { |i| i < pivot }
        greater = array.select { |i| i > pivot }
        return quickSort(less) + [pivot] + quickSort(greater)
      end

      def findMax(array)
        quickSort(array)[-1]
      end
    end
  end
end

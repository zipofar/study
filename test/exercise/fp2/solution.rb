module Exercise
  module Fp2
    class MyArray < Array
      # Использовать стандартные функции массива для решения задач нельзя.
      # Использовать свои написанные функции для реализации следующих - можно.

      # Написать свою функцию my_each
      def my_each(*)
        for i in self
          yield(i) if block_given?
        end
      end

      # Написать свою функцию my_map
      def my_map(*)
        result = self.my_reduce([]) do |acc, i|
          acc << yield(i)
        end
        self.class.new(result)
      end

      # Написать свою функцию my_compact
      def my_compact
        result = self.my_reduce([]) do |acc, i|
          acc << i unless i.nil?
          acc
        end
        self.class.new(result)
      end

      # Написать свою функцию my_reduce
      def my_reduce(init = nil)
        return nil if self.empty?
        acc = init.nil? ? self.first : init
        tail = init.nil? ? self.drop(1) : self
        tail.my_each do |i|
          acc = yield(acc, i) if block_given?
        end
        acc
      end
    end
  end
end

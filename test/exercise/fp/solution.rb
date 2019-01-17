module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        filtered_films = array.select { |film|
          film['country'].nil? ? false : film['country'].split(',').length >= 2 }
          .select { |film| film['rating_kinopoisk'].to_f > 0 }

        sum_of_rating = filtered_films.reduce(0) { |a, e| a += e['rating_kinopoisk'].to_f }
        sum_of_rating / filtered_films.length
      end

      def chars_count(films, threshold)
        films.select { |film| film['rating_kinopoisk'].to_f >= threshold }
             .map { |film| film['name'].chars.reduce(0) { |a, e| e == 'и' ? a += 1 : a } }
             .reduce(0) { |a, e| a += e }
      end
    end
  end
end

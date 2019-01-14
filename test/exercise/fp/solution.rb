module Exercise
  module Fp
    class << self
      # Обратиться к параметрам фильма можно так:
      # film["name"], film["rating_kinopoisk"], film["rating_imdb"],
      # film["genres"], film["year"], film["access_level"], film["country"]
      def rating(array)
        filteredFilms = array.select { |film|
          film['country'].nil? ? false : film['country'].split(',').length >= 2 }
            .select { |film| film['rating_kinopoisk'].to_f > 0  }
        sum_of_rating = filteredFilms.reduce(0) { |memo, film| memo += film['rating_kinopoisk'].to_f }
        sum_of_rating / filteredFilms.length
      end

      def chars_count(films, threshold)
        count = films.select { |film| film['rating_kinopoisk'].to_f >= threshold }
          .map { |film| film['name'].chars.reduce(0) { |acc, e| e == 'и' ? acc += 1 : acc } }
          .reduce(0) { |acc, e| acc += e }
      end
    end
  end
end

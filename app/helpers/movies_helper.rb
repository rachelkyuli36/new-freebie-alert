module MoviesHelper
  # Checks if a number is odd:
  def self.oddness(count)
    count.odd? ?  "odd" :  "even"
  end
end

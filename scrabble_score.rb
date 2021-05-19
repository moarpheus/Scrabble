require 'byebug'

class Scrabble

  DEFAULTS = {
    %w[A, E, I, O, U, L, N, R, S, T] => 1,
    %w[D, G] => 2,
    %w[B, C, M, P] => 3,
    %w[F, H, V, W, Y] => 4,
    %w[K] => 5,
    %w[J, X] => 6,
    %w[Q, Z] => 7
  }

  def initialize input
    @@mappings = DEFAULTS.inject({}) do |memo, (key, value)|
      key.each {|l| memo[l.gsub(',', '')] = value}
      memo
    end
    input.nil? ? @input = '' : @input = input
  end

  def score input=@input
    input.strip.upcase.split('').inject(0) {|sum,x| sum + @@mappings[x].to_i }
  end
end

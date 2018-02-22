#Sluggish Octopus: O(n^2) is the quadratic version (nested iterations)

def quadratic_fish(fishes)
  fishes.each_with_index do |fish1, i|
    max_length = true

    fishes.each_with_index do |fish2, j|
    next if i == j
    max_length = false if fish2.length > fish1.length
    end

    return fish1 if max_length
  end
end


#Dominant Octopus: 0(n logn n): log linear like merge_sort or quicksort

class Array
  def merge_sort(&prc)
    prc ||= Proc.new{ |x, y| x <=> y }
    return self if self.length <= 1

    mid = self.lenghth / 2
    sorted_left = self.take(mid).merge_sort(&prc)
    sorted_right = self.drop(mid).merge_sort(&prc)

    Array.merge(sorted_left, sorted_right, prc)
  end

  private

  def self.merge(left, right &prc)
    merged = []
    until left.empty? || right.empty?
      case prc.call(left.first, right.first)
      when -1
        merged << left.shift
      when 0
        merged << left.shift
      when 1
        merged << right.shift
      end
    end

    merged.concat(left).concat(right)
  end
end

def nlogn_biggest_fish(fishes)
  prc = Proc.new { |x, y| y.length <=> x.length }
  fishes.merge_sort(&prc)[0]
end

#Clever Octopus O(n) linear

def linear_biggest_fish(fishes)
  biggest_fish = fishes.first

  fishes.each do |fish|
    if fish.length > biggest_fish.length
      biggest_fish = fish
    end
  end

  biggest_fish
end

#Dancing Octopus

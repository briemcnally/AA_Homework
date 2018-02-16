class Map

  def initialize
    @map = []
  end

  def assign(key, value)
    pair_index = @map.index {|pair| pair[0] == key}
    pair_index ? @map[pair_index][1] = value : @map.push([key, value])
    [key, value]
  end

  def lookup(key)
    @map.each { |pair| return pair[1] if pair[0] ==  key }
  end

  def remove(key)
    @map.reject! { |pair| pair[0] == key }
  end

  def show
  end
end

p m = Map.new
p m= [[1,2], [2,4], [5,6]]

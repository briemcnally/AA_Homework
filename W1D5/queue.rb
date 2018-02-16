class Queue
  def initialize
    @queue = []
  end

  def enqueue(el)
    @queue.unshift
  end

  def dequeue(el)
    @queue.pop
  end

  def show
    @queue.dup
  end
end

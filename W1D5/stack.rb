class Stack
  
  def initialize
    @stack = []
  end

  def add(el)
    @stack << el
  end

  def remove
    @stack.pop
  end

  def show
    @stack.each do |el|
      puts el
    end
  end
end

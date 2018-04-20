class Map
  def initialize
    @mapped = []
  end

  def assign(key, value)
    if lookup(key).nil?
      @mapped.push([key, value])
    else
      @mapped.each do |el|
        el[1] += value if el[0] == key
      end
    end
  end

  def lookup(key)
    @mapped.each_with_index do |arr, i|
      return arr[1] if arr[0] == key
    end
      nil
  end

  def remove(key)
    @mapped.each_with_index do |arr, i|
      if arr[0] == key
        @mapped = @mapped[0...i] + @mapped[i + 1 .. -1]
      end
    end

    @mapped
  end

  def show
    @mapped.each do |el|
      puts "#{el[0]}: #{el[1]}"
    end
  end

end

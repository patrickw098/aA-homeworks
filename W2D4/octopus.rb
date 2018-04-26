fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

def sluggish_octopus(fishes)

  sorted = false
  until sorted
    sorted = true

    fishes.each_with_index do |fish, i|
      j = i + 1
      next if j == fishes.length

      if fish.length > fishes[j].length
        sorted = false
        fishes[i], fishes[j] = fishes[j], fishes[i]
      end
    end
  end

  fishes.last
end

def dominant_octopus(fishes)

  return fishes.first if fishes.length <= 1

  first_fish = fishes.first

  high = fishes[1..-1].select { |fish| fish.length >= first_fish.length }

  dominant_octopus(high)
end

def clever_octopus(fishes)
  longest = ""

  fishes.each do |fish|
    longest = fish if fish.length > longest.length
  end

  longest
end

tiles_array = ["up", "right-up", "right", "right-down", "down", "left-down", "left",  "left-up" ]

def slow_dance(direction, tiles_array)
  tiles_array.each_with_index do |tile, i|
    return i if tile == direction
  end

  -1
end

tiles_obj = {
  :up => 0,
  :right_up => 1,
  :right => 2,
  :right_down => 3,
  :down => 4,
  :left_down => 5,
  :left => 6,
  :left_up => 7
}

def constant_dance!(direction, obj)
  return obj[direction]
end

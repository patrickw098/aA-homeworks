require 'LRUcache'

RSpec.describe LRUCache do

  subject(:cache) { LRUCache.new(4) }

  describe "#initialize" do

    it "initializes with a max cache value" do
      expect(cache.cache_limit).to be(4)
    end

    it "initializes with an empty cache" do
      expect(cache.count).to be(0)
    end
  end

  describe "#count" do

    it "returns 0 when there are no items in the cache" do
      expect(cache.count).to be(0)
    end

    it "returns the number of items when cache items are added" do
      cache.add("I walk the line")
      cache.add(5)

      expect(cache.count).to be(2)
    end
  end

  describe "#add" do

    it "adds a cache element to the cache" do
      cache.add([1,2,3])

      expect(cache.fake_cache).to eq([[1,2,3]])
    end

    it "reorders elements that already exist in the cache" do
      cache.add(1)
      cache.add([])
      cache.add(1)

      expect(cache.fake_cache).to eq([[],1])
    end

    it "deletes elements when there are max cache values" do
      cache.add([1,2,3])
      cache.add({a: 1, b: 2, c: 3})
      cache.add([1,2,3,4])
      cache.add("I walk the line")
      cache.add(:ring_of_fire)
      cache.add("I walk the line")
      cache.add({a: 1, b: 2, c: 3})

      expect(cache.fake_cache).to eq([[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}])
    end
  end

  describe "#show" do

    it "shows the cache values" do
      cache.add([1,2,3])
      cache.add({a: 1, b: 2, c: 3})
      cache.add([1,2,3,4])
      cache.add("I walk the line")
      cache.add(:ring_of_fire)
      cache.add("I walk the line")
      cache.add({a: 1, b: 2, c: 3})

      expect(cache.show).to eq([[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}])
    end
  end

end

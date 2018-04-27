class LRUCache
  attr_reader :cache_limit, :fake_cache

  def initialize(max)
    @cache_limit = max
    @fake_cache = []
  end

  def count
    fake_cache.length
  end

  def add(el)
    if fake_cache.include?(el)
      fake_cache.delete(el)
    elsif self.count >= cache_limit
      fake_cache.shift
    end
    fake_cache << el
  end

  def show
    @fake_cache.dup
  end

  private


end

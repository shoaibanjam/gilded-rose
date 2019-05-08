class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      if item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert"
        degrade_quality(item)
        degrade_quality(item) if item.name == "Conjured Mana Cake"
      else
        upgrade_quality(item)
        upgrade_backstage(item) if item.name == "Backstage passes to a TAFKAL80ETC concert"
      end
      if item.name != "Sulfuras, Hand of Ragnaros"
        item.sell_in = item.sell_in - 1
      end
      if item.sell_in < 0
        if item.name != "Aged Brie"
          if item.name != "Backstage passes to a TAFKAL80ETC concert"
            degrade_quality(item)
          else
            item.quality = item.quality - item.quality
          end
        else
          upgrade_quality(item)
        end
      end
    end
  end

  def upgrade_backstage(item)
    upgrade_quality(item) if item.sell_in < 11
    upgrade_quality(item) if item.sell_in < 6
  end

  def upgrade_quality(item)
    item.quality = item.quality + 1 if item.quality < 50
  end

  def degrade_quality(item)
    item.quality = item.quality - 1 if item.quality > 0 and item.name != "Sulfuras, Hand of Ragnaros"
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
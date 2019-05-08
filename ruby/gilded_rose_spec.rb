require File.join(File.dirname(__FILE__), 'gilded_rose')

describe GildedRose do

  describe "#update_quality" do
    context "Base cases" do
      it "+5 Dexterity Vest" do
        items = [Item.new("+5 Dexterity Vest", 0, 0)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq -1
        expect(items[0].quality).to eq 0
      end

      it "Aged Brie" do
        items = [Item.new("Aged Brie", 10, 50)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq 9
        expect(items[0].quality).to eq 50
      end

      it "Elixir of the Mongoose" do
        items = [Item.new("Elixir of the Mongoose", 10, 0)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq 9
        expect(items[0].quality).to eq 0
      end

      it "Sulfuras, Hand of Ragnaros" do
        items = [Item.new("Sulfuras, Hand of Ragnaros", 10, 90)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq 10
        expect(items[0].quality).to eq 90
      end

      it "Backstage passes to a TAFKAL80ETC concert" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 0, 10)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq -1
        expect(items[0].quality).to eq 0
      end

      it "Conjured Mana Cake - when quality = 2" do
        items = [Item.new("Conjured Mana Cake", 1, 2)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq 0
        expect(items[0].quality).to eq 0
      end

      it "Conjured Mana Cake - when quality = 1" do
        items = [Item.new("Conjured Mana Cake", 1, 1)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq 0
        expect(items[0].quality).to eq 0
      end
    end

    context "Normal cases" do
      it "+5 Dexterity Vest" do
        items = [Item.new("+5 Dexterity Vest", 5, 2)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq 4
        expect(items[0].quality).to eq 1
      end

      it "Aged Brie" do
        items = [Item.new("Aged Brie", 10, 49)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq 9
        expect(items[0].quality).to eq 50
      end

      it "Elixir of the Mongoose" do
        items = [Item.new("Elixir of the Mongoose", 10, 15)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq 9
        expect(items[0].quality).to eq 14
      end

      it "Sulfuras, Hand of Ragnaros" do
        items = [Item.new("Sulfuras, Hand of Ragnaros", 5, 10)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq 5
        expect(items[0].quality).to eq 10
      end

      it "Backstage passes to a TAFKAL80ETC concert - when days greater than 10" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 11, 10)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq 10
        expect(items[0].quality).to eq 11
      end

      it "Backstage passes to a TAFKAL80ETC concert - when days less than or equal to 10" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 10, 10)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq 9
        expect(items[0].quality).to eq 12
      end

      it "Backstage passes to a TAFKAL80ETC concert - when days less than or equal to 5" do
        items = [Item.new("Backstage passes to a TAFKAL80ETC concert", 5, 10)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq 4
        expect(items[0].quality).to eq 13
      end

      it "Conjured Mana Cake" do
        items = [Item.new("Conjured Mana Cake", 4, 5)]
        GildedRose.new(items).update_quality()
        expect(items[0].sell_in).to eq 3
        expect(items[0].quality).to eq 3
      end
    end
  end
end

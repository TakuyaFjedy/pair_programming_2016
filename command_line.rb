class Card
  def initialize(_n,_t)
    @number = _n
    @type = _t
  end
  def show
    "#{@number},#{@type}"
  end
  attr_reader :number, :type
end

# class Hand
#   1st = Card.
#   2nd
#   def to_a 
#     [1st, 2nd]
#   end
# end

def flash?(_hand)
  types = _hand.map do |c|
    c.type
  end
  types.uniq.count == 1
end

def fourcard?(_hand)
  grouped = _hand.group_by {|card| card.number}
  grouped.any? do |number, cards|
    cards.count == 4
  end
end

def threecard?(_hand)
  grouped = _hand.group_by {|card| card.number}
  t = grouped.any? do |number, cards|
    cards.count == 3
  end
  g = grouped.count == 3
  t && g
end

def fullhouse?(_hand)
  grouped = _hand.group_by {|card| card.number}
  t = grouped.any? do |number, cards|
    cards.count == 3
  end
  g = grouped.count == 2
  t && g
end


def twopair?(_hand)
  grouped = _hand.group_by {|card| card.number}
  t = grouped.any? do |number, cards|
    cards.count == 2
  end
  g = grouped.count == 3
  t && g
end

def onepair?(_hand)
  grouped = _hand.group_by {|card| card.number}
  grouped.count == 4
end

def straight?(_hand)
  sorted = _hand.map do |card|
    card.number
  end.sort
  if sorted == [1,10,11,12,13]
    return true
  end
  minimum = sorted[0]
  expectedArray = (minimum..minimum+4).to_a
  sorted == expectedArray
end

def straightflash?(_hand)
  straight?(_hand)&&flash?(_hand)
end

def royalflash?(_hand)
  sorted = _hand.map do |card|
    card.number
  end.sort
  if sorted == [1,10,11,12,13]
    return flash?(_hand)
  end
  return false
end


#puts Card.new(7,"spade").show

stock = []
13.times do |i|
  stock.push Card.new(i + 1, "spade")
  stock.push Card.new(i + 1, "diamond")
  stock.push Card.new(i + 1, "heart")
  stock.push Card.new(i + 1, "clover")
end
stock.shuffle!
hand = []
5.times do |i|
  hand.push stock.delete_at(i)
end

puts "----------------------"
5.times do |i|
  puts hand[i].show
end

if(flash?(hand))
  puts "フラッシュ!!"
elsif(fourcard?(hand))
  puts "フォーカード!!"
elsif(threecard?(hand))
  puts "スリーカード!!"
elsif(fullhouse?(hand))
  puts "フルハウス!!"
elsif(twopair?(hand))
  puts "ツーペア!!"
elsif(onepair?(hand))
  puts "ワンペア!!"
elsif(straight?(hand))
  puts "ストレート!!"
elsif(straightflash?(hand))
  puts "ストレートフラッシュ!!"
elsif(royalflash?(hand))
  puts "ロイヤルフラッシュ!!"
else
  puts "ノーペア!!"
end

# puts flash?(hand)
# puts fourcard?([Card.new(11,"diamond"),Card.new(11,"spade"),Card.new(11,"heart"),Card.new(11,"clover"),Card.new(3,"spade")])
# puts threecard?([Card.new(11,"diamond"),Card.new(11,"spade"),Card.new(7,"heart"),Card.new(11,"clover"),Card.new(3,"spade")])
# puts fullhouse?([Card.new(11,"diamond"),Card.new(11,"spade"),Card.new(7,"heart"),Card.new(11,"clover"),Card.new(7,"spade")])
# puts twopair?([Card.new(7,"diamond"),Card.new(8,"spade"),Card.new(11,"heart"),Card.new(11,"clover"),Card.new(7,"spade")])
# puts onepair?([Card.new(7,"diamond"),Card.new(8,"spade"),Card.new(11,"heart"),Card.new(11,"clover"),Card.new(3,"spade")])
# puts straight?([Card.new(10,"diamond"),Card.new(11,"spade"),Card.new(12,"heart"),Card.new(1,"clover"),Card.new(13,"spade")])
# puts straightflash?([Card.new(4,"diamond"),Card.new(5,"diamond"),Card.new(3,"diamond"),Card.new(1,"diamond"),Card.new(2,"diamond")])
# puts royalflash?([Card.new(10,"diamond"),Card.new(13,"diamond"),Card.new(12,"diamond"),Card.new(1,"diamond"),Card.new(11,"diamond")])

# if (stock.count==47)
#   puts "good!"
# end

# puts "----------------------"
# stock.each do |c|
#   puts c.show
# end

# card.each do |c|
#   puts c.show
# end

# 1, spade 2, spade


# selectedNumbers = []
# random = Random.new(1234)
# def selectCardIndex
#   i = random.rand(0..51)
#   if selectedNumbers.contains(i)

#   selectedNumbers.push i
#   i
# end



# select = []
# 5.times do
#   i = selectCardIndex
#   select.push card[i]
# end
# puts select


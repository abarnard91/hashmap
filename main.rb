require_relative('lib/hashmap.rb')
require_relative ('lib/linkedlist.rb')
require_relative ('lib/node.rb')

test = HashMap.new
test.set('apple', 'red')
test.set('banana', 'yellow')
test.set('carrot', 'orange')
test.set('dog', 'brown')
test.set('elephant', 'gray')
test.set('frog', 'green')
test.set('grape', 'purple')
test.set('hat', 'black')
test.set('ice cream', 'white')
test.set('jacket', 'blue')
test.set('kite', 'pink')
test.set('lion', 'golden')
puts "#{test.keys}"
puts "#{test.values}"
test.remove('elephant')

test.set('bless', 'you')
puts test.has?('bless')
puts test.get("bless")
puts "#{test.entries}"
test.clear




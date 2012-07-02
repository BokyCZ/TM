@n = 0
80.times do
  a = 0
  o =  [('a'..'z'),('A'..'Z'),('0'..'1')].map{|i| i.to_a}.flatten
  name  =  (1..10).map{ o[rand(o.length)]  }.join
  o =  [('a'..'z'),('A'..'Z'),('0'..'1')].map{|i| i.to_a}.flatten
  team =  (1..10).map{ o[rand(o.length)]  }.join
  pole = ['M', 'Z']
  index = (rand() * 2).to_i
  sex = pole[index]
  age = (rand() * 100).to_i
  @player = Player.new(:name => name, :team => team, :sex => sex, :age => age)
  if @player.save
    a = 1
  end

  b = 0
  first = (rand() * 1000).to_i
  second = (rand() * 1000).to_i
  third = (rand() * 1000).to_i
  fourth = (rand() * 1000).to_i
  @player.qualification = Qualification.new(:first => first, :second => second, :third => third, :fourth => fourth)
  if @player.save
    b = 1
  end

  if a == 1 and b == 1
    @n = @n + 1
  end

end

puts "rake db:seed was SUCCESSFUL COMPLETE with #{@n} records from 80"


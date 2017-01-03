digits = ARGV[0..3].map(&:to_i)
target = ARGV[4].to_i

under = lambda{|a,b| b/a}
def under.to_s
  "\\"
end

unminus = lambda{|a,b| b-a}
def unminus.to_s
  "~"
end

ops = [:+, :-, :/, :*, under, unminus]

def arrangements(items, count)
  arrangements_count = items.length ** count
  Enumerator.new do |y|
    arrangements_count.times do |arrangement_num|
      arrangement = []
      count.times do |c|
        arrangement << items[arrangement_num % items.length]
        arrangement_num /= items.length
      end
      y << arrangement
    end
  end
end

repeats = {}
digits.permutation.each do |permutation|
  next if repeats[permutation]
  repeats[permutation] = true

  arrangements(ops, digits.length - 1).each do |arrangement|
    acc = permutation.first.to_f

    permutation[1..-1].each_with_index do |d,i|
      op = arrangement[i]
      acc = op.to_proc[acc, d]
    end

    if acc.round(5) == target
      puts permutation.zip(arrangement).flatten.join + "=" + acc.round(5).to_s
    end
  end
end

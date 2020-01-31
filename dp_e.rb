# https://atcoder.jp/contests/dp/tasks/dp_e
n, w_max = gets.split.map(&:to_i)
items = Array.new(n){gets.split.map(&:to_i)}
v_max = items.map(&:last).inject(:+)
dp = Array.new(v_max+1, Float::INFINITY)
dp[0] = 0
items.each do |wi, vi|
  prev = dp.dup
  (vi..v_max).each do |v|
    w = wi + prev[v-vi]
    dp[v] = w if w <= w_max && w < prev[v]
  end
end
puts dp.rindex{|v|v != Float::INFINITY}

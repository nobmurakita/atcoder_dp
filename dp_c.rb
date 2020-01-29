# https://atcoder.jp/contests/dp/tasks/dp_c
n = gets.to_i
a = Array.new(n){gets.split.map(&:to_i)}
dp = Array.new(n){Array.new(3, 0)}
dp[0] = a[0]
(1...n).each do |i|
  dp[i][0] = [dp[i-1][1], dp[i-1][2]].max + a[i][0]
  dp[i][1] = [dp[i-1][0], dp[i-1][2]].max + a[i][1]
  dp[i][2] = [dp[i-1][0], dp[i-1][1]].max + a[i][2]
end
puts dp.last.max

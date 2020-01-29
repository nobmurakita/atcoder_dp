# https://atcoder.jp/contests/dp/tasks/dp_a
n = gets.to_i
h = gets.split.map(&:to_i)
dp = Array.new(n)
dp[0] = 0
dp[1] = (h[1] - h[0]).abs
(2..n-1).each do |i|
  a = dp[i-1] + (h[i] - h[i-1]).abs 
  b = dp[i-2] + (h[i] - h[i-2]).abs
  dp[i] = [a, b].min
end
puts dp.last

# https://atcoder.jp/contests/dp/tasks/dp_h
h, w = gets.split.map(&:to_i)
g = Array.new(h){gets.chomp.chars}
dp = Array.new(h){Array.new(w, 0)}
dp[0][0] = 1
h.times do |i|
  w.times do |j|
    dp[i][j] += dp[i-1][j] if 0 < i && g[i-1][j] == '.'
    dp[i][j] += dp[i][j-1] if 0 < j && g[i][j-1] == '.'
    dp[i][j] %= 10**9+7
  end
end
puts dp[h-1][w-1]

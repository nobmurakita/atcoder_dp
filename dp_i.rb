# https://atcoder.jp/contests/dp/tasks/dp_i
n = gets.to_i
coins = gets.split.map(&:to_f)
dp = Array.new(n+1){Array.new(n+1, 0.0)}
dp[0][0] = 1.0
coins.each.with_index(1) do |p, i|
  dp_cur, dp_prev = dp[i], dp[i-1] # TLE対策
  (0..i).each do |j|
    dp_cur[j] += dp_prev[j-1] * p if j > 0
    dp_cur[j] += dp_prev[j] * (1 - p)
  end
end
puts dp[n][(n+1)/2..-1].inject(:+)

# https://atcoder.jp/contests/dp/tasks/dp_f
s = gets.chomp.chars
t = gets.chomp.chars
n = s.size
m = t.size

dp = Array.new(n+1){Array.new(m+1, 0)}
n.times do |i|
  dp_cur, dp_next = dp[i], dp[i+1] # TLE対策
  m.times do |j|
    if s[i] == t[j]
      dp_next[j+1] = dp_cur[j] + 1
    else
      a = dp_cur[j+1]
      b = dp_next[j]
      dp_next[j+1] = a > b ? a : b
    end
  end
end

i, j = n, m
ans = ''
while i > 0 && j > 0 do
  if dp[i][j] == dp[i-1][j]
    i -= 1
  elsif dp[i][j] == dp[i][j-1]
    j -= 1
  else
    ans << s[i-1]
    i -= 1
    j -= 1
  end
end

puts ans.reverse

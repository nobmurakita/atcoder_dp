# https://atcoder.jp/contests/dp/tasks/dp_g
if !ENV['RUBY_THREAD_VM_STACK_SIZE']
  exec({'RUBY_THREAD_VM_STACK_SIZE'=>'1000000000'}, '/usr/bin/ruby', $0)
end

def rec(v, g, dp)
  return dp[v] if dp[v] != -1
  res = 0
  g[v].each do |nv|
    d = rec(nv, g, dp) + 1
    res = d if d > res
  end
  dp[v] = res
end

n, m = gets.split.map(&:to_i)
g = Array.new(n+1){[]}
dp = Array.new(n+1){-1}
m.times do
  x, y = gets.split.map(&:to_i)
  g[x] << y
end

ans = 0
(1..n).each do |v|
  d = rec(v, g, dp)
  ans = d if d > ans
end
puts ans

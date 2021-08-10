#
# @lc app=leetcode.cn id=313 lang=ruby
#
# [313] 超级丑数
#

# @lc code=start
# @param {Integer} n
# @param {Integer[]} primes
# @return {Integer}
def nth_super_ugly_number(n, primes)
    if n == 1
        return 1
    end
    r = 1
    h = MinHeap.new
    h.push(primes[0], Enode.new(1, 0))
    (2..n).each{
        |_|
        en = h.pop
        r = (en.v) * primes[en.idx]
        h.push(r * primes[en.idx], Enode.new(r, en.idx))
        # puts "==#{r}"
        if en.idx + 1 < primes.length
            en.idx += 1
            h.push(en.v * primes[en.idx], en)
        end
    }
    return r
end
class Enode
    attr_accessor :v, :idx
    def initialize(v, idx)
        @v, @idx = v, idx
    end
end
# @lc code=end

if __FILE__ == $0
    p nth_super_ugly_number(12, [2,7,13,19])
end

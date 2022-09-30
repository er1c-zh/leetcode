#
# @lc app=leetcode.cn id=433 lang=ruby
#
# [433] 最小基因变化
#

# @lc code=start
# @param {String} start
# @param {String} end
# @param {String[]} bank
# @return {Integer}
def min_mutation(start, _end, bank)
    n = start.length
    set = Hash.new
    bank.each{
        |s|
        set[s] = true
    }
    mask = Hash.new
    mask[start] = true
    queue = [start]
    result = 0
    while !queue.empty? && result <= 8
        nq = []
        queue.each{
            |pre|
            if pre == _end
                return result
            end
            (0..n-1).each{
                |i|
                ["A", "C", "G", "T"].each{
                    |d|
                    tmp = pre.clone
                    tmp[i] = d
                    if mask[tmp] == nil && set[tmp] == true
                        mask[tmp] = true
                        nq.append tmp
                    end
                }
            }
        }
        queue = nq
        result += 1
    end
    return -1
end
# @lc code=end

if __FILE__ == $0
    # puts "#{min_mutation "AACCGGTT", "AACCGGTA", ["AACCGGTA"]}"
    # puts "#{min_mutation "AACCGGTT", "AAACGGTA", ["AACCGGTA","AACCGCTA","AAACGGTA"]}"
    puts "#{min_mutation "AACCGGTT" ,"AAACGGTA" ,["AACCGATT","AACCGATA","AAACGATA","AAACGGTA"]}"
end

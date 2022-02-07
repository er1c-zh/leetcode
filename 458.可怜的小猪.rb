#
# @lc app=leetcode.cn id=458 lang=ruby
#
# [458] 可怜的小猪
#

# @lc code=start
# @param {Integer} buckets
# @param {Integer} minutes_to_die
# @param {Integer} minutes_to_test
# @return {Integer}
def poor_pigs(buckets, minutes_to_die, minutes_to_test)
    rounds = minutes_to_test / minutes_to_die
    return (Math.log(buckets) / Math.log(rounds + 1)).ceil
end
# @lc code=end

if __FILE__ == $0
    puts "#{poor_pigs(1000, 15, 60)}"
    puts "#{poor_pigs(4, 15, 15)}"
end

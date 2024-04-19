#
# @lc app=leetcode.cn id=649 lang=ruby
#
# [649] Dota2 参议院
#

# @lc code=start
# @param {String} senate
# @return {String}
def predict_party_victory(senate)
    # Radiant + Dire -
    result = ""
    cur = 0
    while true
        ns = ""
        for i in 0...senate.size
            c = senate[i]
            if c == "R"
                cur += 1
                if cur > 0
                    ns += c
                end
            else
                cur -= 1
                if cur < 0
                    ns += c
                end
            end
        end
        senate = ns
        if cur.abs >= senate.size
            break
        end
    end
    return cur > 0 ? "Radiant" : "Dire"
end
# @lc code=end

if __FILE__ == $0
    puts "#{predict_party_victory "RD"}"
    puts "#{predict_party_victory "RDD"}"
end

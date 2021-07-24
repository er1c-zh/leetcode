#
# @lc app=leetcode.cn id=299 lang=ruby
#
# [299] 猜数字游戏
#

# @lc code=start
# @param {String} secret
# @param {String} guess
# @return {String}
def get_hint(secret, guess)
    h = Hash.new{
        0
    }
    (0..secret.length-1).each{
        |idx|
        h[secret[idx]] += 1
    }
    cntCows, cntBulls = 0, 0
    (0..guess.length-1).each{
        |idx|
        c = guess[idx]
        if h[c] > 0
            cntCows += 1
            h[c] -= 1
        end
    }
    (0..secret.length-1).each{
        |idx|
        if secret[idx] == guess[idx]
            cntCows -= 1
            cntBulls += 1
        end
    }

    return '%dA%dB' % [cntBulls, cntCows]
end
# @lc code=end

if __FILE__ == $0
    p get_hint '1807', '7810'
end

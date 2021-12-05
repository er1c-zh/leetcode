#
# @lc app=leetcode.cn id=388 lang=ruby
#
# [388] 文件的最长绝对路径
#

# @lc code=start
# @param {String} input
# @return {Integer}
def length_longest_path(input)
    strs = input.split("\n")
    curPrefixLen = []
    curLevel = 0
    result = 0
    strs.each{
        |s|
        level = s.count("\t")
        isFile = s.count(".") > 0
        real = s.delete("\t")
        while level <= curLevel
            curLevel -= 1
            curPrefixLen = curPrefixLen[0..-2]
        end
        if isFile
            len = curPrefixLen.sum + real.length + level
            if len > result
                result = len
            end
        else
            curPrefixLen.append real.length
            curLevel += 1
        end
    }
    return result
end
# @lc code=end

if __FILE__ == $0
    puts "#{length_longest_path "dir\n\tsubdir1\n\tsubdir2\n\t\tfile.ext"}"
    puts "#{length_longest_path "dir\n\tsubdir1\n\t\tfile1.ext\n\t\tsubsubdir1\n\tsubdir2\n\t\tsubsubdir2\n\t\t\tfile2.ext"}"
    puts "#{length_longest_path "a"}"
    puts "#{length_longest_path "file1.txt\nfile2.txt\nlongfile.txt"}"
    # puts "#{length_longest_path }"
end

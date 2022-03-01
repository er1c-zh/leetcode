#
# @lc app=leetcode.cn id=472 lang=ruby
#
# [472] 连接词
#

# @lc code=start
# @param {String[]} words
# @return {String[]}
class TrieNode
    attr_accessor :children, :isLeaf
    def initialize()
        @isLeaf = false
        @children = Array.new(26)
    end
end

def find_all_concatenated_words_in_a_dict(words)
    result = []
    root = TrieNode.new
    words.sort{
        |x, y|
        x.length <=> y.length
    }.each{
        |w|
        queue = [root] # 当前匹配中的节点
        cur_node = root
        from_root = false
        matched = false
        w.each_char{
            |c|
            matched = false
            from_root = false
            i = idx(c)
            nq = []
            queue.each{
                |qn|
                if qn.children[i] == nil
                    next
                end
                nn = qn.children[i]
                nq.append nn
                if nn.isLeaf 
                    matched = true
                    if !from_root
                        nq.append root
                        from_root = true
                    end
                end
            }
            queue = nq
            if cur_node.children[i] == nil
                cur_node.children[i] = TrieNode.new
            end
            cur_node = cur_node.children[i]
        }
        cur_node.isLeaf = true
        if matched
            result.append w
        end
    }
    return result
end

def idx(c)
    return c.ord - 'a'.ord
end

# @lc code=end

if __FILE__ == $0
    puts "#{find_all_concatenated_words_in_a_dict ["cat","cats","catsdogcats","dog","dogcatsdog","hippopotamuses","rat","ratcatdogcat"]}"
    puts "#{find_all_concatenated_words_in_a_dict ["cat","dog","catdog"]}"
end

#
# @lc app=leetcode.cn id=691 lang=ruby
#
# [691] 贴纸拼词
#

# @lc code=start
# @param {String[]} stickers
# @param {String} target
# @return {Integer}
def min_stickers(stickers, target)
    t = Hash::new{[]}
    (0...target.length).each {
        |i|
        t[target[i]] = t[target[i]].append (1 << i);
    }
    set = Hash::new
    stickers.each {
        |s|
        ns = ""
        (0...s.length).each {
            |i|
            if t[s[i]].length != 0
                ns += s[i]
            end
        }
        set[ns.chars.sort.join] = 1
    }
    puts "#{set.keys}"
    r, _ = helper((1 << target.length) - 1, Hash::new, t, set.keys)
    r
end

def helper(bm, cache, target, stickers)
    if bm == 0
        return 0, cache
    end
    if cache[bm] != nil
        return cache[bm], cache
    end
    result = -1
    for s in stickers
        nbm = bm
        (0...s.length).each {
            |i|
            c = s[i]
            target[c].each {
                |m|
                if (nbm & m) > 0
                    nbm = nbm ^ m
                    break
                end
            }
        }
        if nbm == bm
            next
        end
        # puts "#{bm.to_s 2}, #{nbm.to_s 2}, #{s}, #{cache}"
        nr, cache = helper(nbm, cache, target, stickers)
        if nr > -1 && (result == -1 || nr + 1 < result)
            result = nr + 1
        end
    end
    cache[bm] = result
    return result, cache
end

# @lc code=end

if __FILE__ == $0
    puts "#{min_stickers ["with","example","science"], "thehat"}"
    puts "#{min_stickers ["notice","possible"], "basicbasic"}"
    puts "#{min_stickers ["these","guess","about","garden","him"], "atomher" }"
    puts "#{min_stickers ["heart","seven","consider","just","less","back","an","four","cost","kill","skin","happen","depend","broad","caught","fast","fig","way","under","print","white","war","sent","locate","be","noise","door","get","burn","quite","eight","press","eye","wave","bread","wont","short","cow","plain","who","well","drive","fact","chief","store","night","operate","page","south","once"],    "simpleexample" }"
    puts "#{min_stickers ["gone","dont","bell","simple","colony","mine","carry","sleep","village","ready","ground","sell","use","lead","doctor","stretch","less","except","long","why","indicate","live","animal","blow","inch","got","include","hope","real","then","string","degree","syllable","blue","stop","job","key","class","he","valley","did","country","space","heat","collect","truck","mother","problem","toward","my"], "brightmethod" }"
end

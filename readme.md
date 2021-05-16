# leetcode in ruby

## some question

### **Ruby** do **NOT** use `class Node`

leetcode will overwrite `Node` this will make runtime error.

```plain
// 异常的情况：会一直出现这个问题，本地运行是成功的。
Line 107: wrong number of arguments (given 0, expected 2) (ArgumentError) in trie.rb (initialize)

Line 43 in solution.rb (new)
Line 43 in solution.rb (insert)
Line 180 in solution.rb (<main>)
```

easy but NOT easy

1. 169
1. 172


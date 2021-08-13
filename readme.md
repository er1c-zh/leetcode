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

## some interesting easy problems

1. 169
1. 172
1. 220 用桶去做一个分类
1. 226 你能白板写一个反转二叉树的函数吗？
1. 310 避免思路僵化
1. 316 贪心的题目

# Leetcode in ruby

## memo

```shell
./contest.sh 999
./contest.sh 999 bi
make clean # 归档文件
```

## Some question

### **Ruby** do **NOT** use `class Node`

Leetcode will overwrite `Node` this will make runtime error.

Leetcode import an algorithm lib which has a class named `Node`.

```plain
// 异常的情况：会一直出现这个问题，本地运行是成功的。
Line 107: wrong number of arguments (given 0, expected 2) (ArgumentError) in trie.rb (initialize)

Line 43 in solution.rb (new)
Line 43 in solution.rb (insert)
Line 180 in solution.rb (<main>)
```

## Interesting problems

1. 169
1. 172
1. 220 用桶去做一个分类
1. 226 你能白板写一个反转二叉树的函数吗？
1. 310 避免思路僵化
1. 316 贪心的题目
1. 319 智力题
1. 324 快速选择获取中位数，O(n)时间复杂度，算法导论第九章。
1. 327 分治时可以叠加排序来做一些搜索上的优化
1. 338 线性时间计算整数的二进制表示的1的数量
1. 365 模拟 && 维护调用栈
1. 377 审题+全排列计数
1. 388 ruby 字符串操作

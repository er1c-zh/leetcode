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
1. 363 有序集合
1. 365 模拟 && 维护调用栈
1. 377 审题+全排列计数
1. 388 468 ruby 字符串操作
1. 391 扫描线
1. 416 关注数据范围可以剪掉数据来保证数据缓存是能够接受的大小
1. 435 选择出 <-> 删除掉 可以都思考一下
1. 440 前缀处理考虑树
1. 462 负数的处理有时可以通过转换成非负数？
1. 464 记忆化搜索，当一个状态固定时，可能不需要更多的key来cache。
1. 466 类比无限循环小数 && 边界条件的处理
1. 473 十分有意思的剪枝思路
1. 479 打表
2. 483 数学题，在较小的数据集上枚举验证
1. 493 归并
1. 501 中序遍历二叉搜索树相当于遍历有序数组，可以通过传一个ctx来实现原地遍历。
1. 514 环形数组计算两个idx的最小距离 `[(i - j).abs, n - (i - j).abs].min`
1. 546 剪枝 + 区间dp + 如何设计dp中的状态表示 / 递归dp来实现剪枝
1. 552 原地dp过TLE
1. 556 下一个更大的数字，找到第一个下降的v/将最小大于v的值提前/重排suffix
1. 592 最小公倍数 * 最大公约数 == 两数乘积 分子 numerator 分母 denominator
1. 630 贪心可以动态的贪心，相对于有一个“规则”来一下子决定是否要选或者不选 && 优先队列配贪心
1. 684 并查集思想，每次加入节点更新所在集合状态。
1. 668 转换二分的目标 && 考虑活性

# dalao的经验！

- 括号匹配

    > 令平衡值表示某一位置处，累积的(数量与)数量的差值，则我们知道，一个有效括号字符串必须满足：
    > 所有位置处的平衡值非负
    > 结尾处的平衡值为零

/*
 * @lc app=leetcode.cn id=501 lang=golang
 *
 * [501] 二叉搜索树中的众数
 */

// @lc code=start
/**
 * Definition for a binary tree node.
 * type TreeNode struct {
 *     Val int
 *     Left *TreeNode
 *     Right *TreeNode
 * }
 */
func findMode(root *TreeNode) []int {
	ctx := &Ctx{
		curVal: Invalid,
	}
	helper(ctx, root)
	if ctx.curVal != Invalid && ctx.curCnt > ctx.cnt {
		return []int{ctx.curVal}
	}
	if ctx.curVal != Invalid && ctx.curCnt == ctx.cnt {
		ctx.result = append(ctx.result, ctx.curVal)
	}
	return ctx.result
}

const Invalid = 1e5 + 1

type Ctx struct {
	result []int
	cnt int
	curVal int
	curCnt int
}

func helper(ctx *Ctx, cur *TreeNode) {
	if cur == nil {
		return
	}
	helper(ctx, cur.Left)
	if cur.Val == ctx.curVal {
		ctx.curCnt += 1
	} else {
		if ctx.curCnt > ctx.cnt {
			ctx.result = []int{ctx.curVal}
			ctx.cnt = ctx.curCnt
		} else if ctx.curCnt == ctx.cnt {
			ctx.result = append(ctx.result, ctx.curVal)
		}
		ctx.curVal = cur.Val
		ctx.curCnt = 1
	}
	helper(ctx, cur.Right)
}

// @lc code=end


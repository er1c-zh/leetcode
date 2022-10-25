/*
 * @lc app=leetcode.cn id=500 lang=golang
 *
 * [500] 键盘行
 */

// @lc code=start
var m = helper()

func helper() map[rune]int8 {
	m := make(map[rune]int8, 26)
	src := map[int8]string {
		0b1: "qwertyyuiop",
		0b10: "asdfghjkl", 
		0b100: "zxcvbnm",
	}
	for mask, w := range src {
		for _, b := range w {
			m[b] = mask
		}
	}
	return m
}
func findWords(words []string) []string {
	result := make([]string, 0, len(words))
	for _, w := range words  {
		mask := int8(0)
		for _, b := range w {
			mask |= m[b]
		}
		if mask != 0b1 && mask != 0b10 && mask != 0b100 {
			continue
		}
		result = append(result, w)
	}
	return result
}
// @lc code=end


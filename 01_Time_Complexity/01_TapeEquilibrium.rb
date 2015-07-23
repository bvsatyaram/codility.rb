# Time Complexity: O(n)
# Space Complexity: O(1)
# Link to evaluation result: https://codility.com/demo/results/demoNFWSXB-NK3/

def solution(a)
  total_sum = a.reduce(:+)
  first_sum = a[0]
  second_sum = total_sum - first_sum
  min_diff = (first_sum - second_sum).abs

  (1..(a.length-2)).each do |i|
    first_sum += a[i]
    second_sum -= a[i]
    abs_diff = (first_sum - second_sum).abs
    min_diff = abs_diff if abs_diff < min_diff
  end

  return min_diff
end

require 'minitest/autorun'

class TestTapeEquilibrium < MiniTest::Test
  def test_default_case
    assert_equal 1, solution([3, 1, 2, 4, 3])
  end

  def test_double_same
    assert_equal 0, solution([2, 2])
  end

  def test_double_increasing
    assert_equal 3, solution([2, 5])
  end

  def test_double_decreasing
    assert_equal 3, solution([5, 2])
  end
end
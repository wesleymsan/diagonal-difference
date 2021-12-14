#!/bin/ruby

require 'json'
require 'stringio'
require 'matrix'

#
# Complete the 'diagonalDifference' function below.
#
# The function is expected to return an INTEGER.
# The function accepts 2D_INTEGER_ARRAY arr as parameter.
#

def diagonalDifference(arr)    
  diagonal_sum = 0
  skew_diagonal_sum = 0

  arr.each_with_index do |row, i|
    diagonal_sum += row[i]
    skew_diagonal_sum += row[-i-1]
  end
  
  (diagonal_sum - skew_diagonal_sum).abs
end

fptr = File.open(ENV['OUTPUT_PATH'], 'w')

n = gets.strip.to_i

arr = Array.new(n)

n.times do |i|
    arr[i] = gets.rstrip.split.map(&:to_i)
end

result = diagonalDifference arr

fptr.write result
fptr.write "\n"

fptr.close()


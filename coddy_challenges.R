# Operators Part 1 Challenge
# Given variables
student_score <- 78
passing_score <- 60
perfect_score <- 100
class_average <- 72

# TODO: Write your code below
# Use comparison operators to create the following logical variables:
# 1. passed - check if student_score >= passing_score
passed = student_score >= passing_score
# 2. is_perfect - check if student_score == perfect_score
is_perfect <- student_score == perfect_score
# 3. above_average - check if student_score > class_average
above_average <- student_score > class_average
# 4. not_failing - check if student_score != 0
not_failing <- student_score != 0
# 5. needs_improvement - check if student_score < passing_score
needs_improvement <- student_score < passing_score

# Print the results in order
print(passed)
print(is_perfect)
print(above_average)
print(not_failing)
print(needs_improvement)
Question 1

With a block the object value and it's id changes while inside the block affect both even after the block ends.

Question 2

With a method the object value and it's id changes while inside the method do NOT affect either after the method ends.

Question 3

The String#+= operation is a reassignment therefore does not keep the action committed to it from inside the method where as Array#<< still points to the original object it returns the object with the action committed to it when the method is called.

Question 4

Proving the statement in Q3.

Question 5

def color_valid(color)
  (color == "blue" || color == "green") ? true : false
end 
color_valid("blue")

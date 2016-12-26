Question 1

This should return "nil" because objects are naturally true and naturally empty so there isn't a case for when greeting = true, therefore the return is "nil"

"if true
  greeting = “hello world”
end

greeting"
This returns "hello world" to show the converse.

Question 2

It should return greetings = { a: 'hi there'} because the "<<" operator modified the object.

Question 3

A)  one
    two
    three

B)  one
    two
    three

C)  two
    three
    one

Question 4

def generate_uuid
  arr = ('a'..'z').to_a + ('A'..'Z').to_a + (0..9).to_a
  uuid_code = ""
  int = 0
  while int < 32
    uuid_code << arr.sample.to_s
    int += 1
  end
  uuid_code.insert(8, "-").insert(13, "-").insert(18, "-")
  p uuid_code
end


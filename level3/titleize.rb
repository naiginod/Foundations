def titleize(words)
  arr_words = words.split(" ")
  arr_words.map{|x| x.capitalize!}
  p arr_words.join(" ")
end
titleize("the empire strikes back")
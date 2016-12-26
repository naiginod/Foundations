munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munster = munsters.each do |x, y|
  case y["age"]
    when (0..17) then y["age_group"] = "kid"
    when (18..64) then y["age_group"] = "adult"
    else y["age_group"] = "senior"
  end
end
puts munster


  
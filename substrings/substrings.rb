dictionary = [
  "below",
  "down",
  "go",
  "going",
  "horn",
  "how",
  "howdy",
  "it",
  "i",
  "low",
  "own",
  "part",
  "partner",
  "sit"
]

def substrings(string, dictionary)
  downcase_str = string.downcase
  match_array = dictionary.select do |substr|
    downcase_str.split(substr)[0] != downcase_str
  end
  array_count = match_array.map do |substr|
    [substr, downcase_str.scan(substr).length]
  end
  array_count.to_h
end
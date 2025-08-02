import gleam/list
import gleam/string

fn sort_letters(s: String) -> List(String) {
  s |> string.to_graphemes |> list.sort(string.compare)
}

fn is_anagram(s1: String, s2: String) -> Bool {
  let #(s1, s2) = #(string.lowercase(s1), string.lowercase(s2))
  s1 != s2
  && s1 |> string.length == s2 |> string.length
  && s1 |> sort_letters == s2 |> sort_letters
}

pub fn find_anagrams(word: String, candidates: List(String)) -> List(String) {
  list.filter(candidates, fn(candidate) { candidate |> is_anagram(word) })
}

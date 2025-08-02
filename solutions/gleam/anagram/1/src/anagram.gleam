import gleam/int
import gleam/list
import gleam/string

fn convert_string_to_sorted_utf_codepoints(s: String) -> List(Int) {
  s
  |> string.to_utf_codepoints
  |> list.map(string.utf_codepoint_to_int)
  |> list.sort(int.compare)
}

fn strings_have_same_letters(s1: String, s2: String) -> Bool {
  let #(s1, s2) = #(string.lowercase(s1), string.lowercase(s2))
  s1 != s2
  && string.length(s1) == string.length(s2)
  && convert_string_to_sorted_utf_codepoints(s1)
  == convert_string_to_sorted_utf_codepoints(s2)
}

pub fn find_anagrams(word: String, candidates: List(String)) -> List(String) {
  list.filter(candidates, fn(candidate) {
    strings_have_same_letters(word, candidate)
  })
}

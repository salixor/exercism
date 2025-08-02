import gleam/list
import gleam/regex
import gleam/string

pub fn is_pangram(sentence: String) -> Bool {
  let assert Ok(re) = regex.from_string("[a-zA-Z]")
  sentence
  |> string.lowercase
  |> string.to_graphemes
  |> list.unique
  |> list.filter(fn(x) { x |> regex.check(re, _) })
  |> list.length
  == 26
}

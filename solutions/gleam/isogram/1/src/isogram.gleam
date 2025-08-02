import gleam/bool
import gleam/dict
import gleam/list
import gleam/string

pub fn is_isogram(phrase phrase: String) -> Bool {
  phrase
  |> string.lowercase
  |> string.to_graphemes
  |> list.filter(fn(x) { x != "-" && x != " " })
  |> list.group(fn(i) { i })
  |> dict.values
  |> list.any(fn(x) { x |> list.length > 1 })
  |> bool.negate
}

import gleam/string

pub fn reverse(value: String) -> String {
  case value |> string.pop_grapheme {
    Ok(#(a, b)) -> b |> reverse <> a
    Error(_) -> ""
  }
}

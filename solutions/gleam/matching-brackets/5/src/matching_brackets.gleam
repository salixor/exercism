import gleam/dict
import gleam/list.{Continue, Stop}
import gleam/result
import gleam/string

pub fn is_paired(value: String) -> Bool {
  let brackets_pairs = dict.from_list([#(")", "("), #("}", "{"), #("]", "[")])

  value
  |> string.to_graphemes
  |> list.fold_until([], fn(seen_brackets, c) {
    case c {
      "(" | "{" | "[" -> Continue([c, ..seen_brackets])
      ")" | "}" | "]" ->
        case seen_brackets {
          [] -> Stop(["no_more_brackets"])
          [h, ..other_seen_brackets] ->
            case h == brackets_pairs |> dict.get(c) |> result.unwrap("") {
              True -> Continue(other_seen_brackets)
              _ -> Stop(seen_brackets)
            }
        }
      _ -> Continue(seen_brackets)
    }
  })
  |> list.is_empty
  // case value |> string.pop_grapheme {
  //   Ok(#(head, rest)) ->

  //   _ -> list.is_empty(seen_brackets)
  // }
}

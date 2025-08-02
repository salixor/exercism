import gleam/dict
import gleam/list
import gleam/result
import gleam/string

fn is_paired_internal(value: String, seen_brackets: List(String)) -> Bool {
  let brackets_pairs = dict.from_list([#(")", "("), #("}", "{"), #("]", "[")])
  case value |> string.pop_grapheme {
    Ok(#(head, rest)) ->
      case head {
        "(" | "{" | "[" -> is_paired_internal(rest, [head, ..seen_brackets])
        ")" | "}" | "]" ->
          case seen_brackets {
            [] -> False
            [h, ..other_seen_brackets] ->
              h == brackets_pairs |> dict.get(head) |> result.unwrap("")
              && is_paired_internal(rest, other_seen_brackets)
          }
        _ -> is_paired_internal(rest, seen_brackets)
      }
    _ -> list.is_empty(seen_brackets)
  }
}

pub fn is_paired(value: String) -> Bool {
  is_paired_internal(value, [])
}

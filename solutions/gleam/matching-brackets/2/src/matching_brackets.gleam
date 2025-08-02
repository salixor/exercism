import gleam/dict
import gleam/list
import gleam/result
import gleam/string

fn check_has_matching_bracket(
  value: String,
  end_bracket: String,
  seen_brackets: List(String),
) -> Bool {
  case seen_brackets {
    [] -> False
    [head, ..other_seen_brackets] ->
      head == end_bracket && is_paired_internal(value, other_seen_brackets)
  }
}

fn is_paired_internal(value: String, seen_brackets: List(String)) -> Bool {
  let brackets_pairs = dict.from_list([#(")", "("), #("}", "{"), #("]", "[")])
  case value |> string.pop_grapheme {
    Ok(#(head, rest)) ->
      case head {
        "(" | "{" | "[" -> is_paired_internal(rest, [head, ..seen_brackets])
        ")" | "}" | "]" ->
          check_has_matching_bracket(
            rest,
            brackets_pairs |> dict.get(head) |> result.unwrap(""),
            seen_brackets,
          )
        _ -> is_paired_internal(rest, seen_brackets)
      }
    _ -> list.is_empty(seen_brackets)
  }
}

pub fn is_paired(value: String) -> Bool {
  is_paired_internal(value, [])
}

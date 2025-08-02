import gleam/int
import gleam/list
import gleam/result
import gleam/string

fn compute_diamond_size_from_letter(letter: String) -> Int {
  let utf_codepoint =
    letter
    |> string.to_utf_codepoints
    |> list.map(string.utf_codepoint_to_int)
    |> list.first
    |> result.unwrap(0)
  { utf_codepoint - 64 } * 2 - 1
}

fn number_to_letter(n: Int) -> String {
  case n + 65 |> string.utf_codepoint {
    Ok(codepoint) -> [codepoint] |> string.from_utf_codepoints
    _ -> ""
  }
}

fn generate_string_for_line(letter: String, size: Int, index: Int) -> String {
  let mid = { size - 1 } / 2
  case size {
    1 -> letter
    _ -> {
      list.range(1, size)
      |> list.index_fold("", fn(acc, _, idx) {
        acc
        <> case mid + index - idx == 0 || mid - index - idx == 0 {
          True -> letter
          False -> " "
        }
      })
    }
  }
}

pub fn build(letter: String) -> String {
  let diamond_size = letter |> compute_diamond_size_from_letter
  let mid = { diamond_size + 1 } / 2
  list.range(0, diamond_size - 1)
  |> list.map(fn(idx) {
    let idx = case idx > mid - 1 {
      True -> diamond_size - 1 - idx |> int.absolute_value
      False -> idx
    }
    idx
    |> int.absolute_value
    |> number_to_letter
    |> generate_string_for_line(diamond_size, idx)
  })
  |> string.join("\n")
}

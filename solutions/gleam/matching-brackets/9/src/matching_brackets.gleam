import gleam/list.{Continue, Stop}
import gleam/string

pub fn is_paired(value: String) -> Bool {
  let result = {
    use seen_brackets, c <- list.fold_until(value |> string.to_graphemes, [])

    case seen_brackets, c {
      ["(", ..rest], ")" -> Continue(rest)
      ["{", ..rest], "}" -> Continue(rest)
      ["[", ..rest], "]" -> Continue(rest)
      rest, "(" -> Continue([c, ..rest])
      rest, "{" -> Continue([c, ..rest])
      rest, "[" -> Continue([c, ..rest])
      _, ")" -> Stop(["error"])
      _, "}" -> Stop(["error"])
      _, "]" -> Stop(["error"])
      _, _ -> Continue(seen_brackets)
    }
  }
  // })
  result |> list.is_empty
}

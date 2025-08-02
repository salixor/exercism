import gleam/list.{Continue, Stop}
import gleam/result
import gleam/string

pub fn is_paired(value: String) -> Bool {
  let result = {
    use seen_brackets, c <- list.fold_until(
      value |> string.to_graphemes,
      Ok([]),
    )
    let assert Ok(seen_brackets) = seen_brackets

    case seen_brackets, c {
      ["(", ..rest], ")" -> Continue(Ok(rest))
      ["{", ..rest], "}" -> Continue(Ok(rest))
      ["[", ..rest], "]" -> Continue(Ok(rest))
      rest, "(" -> Continue(Ok([c, ..rest]))
      rest, "{" -> Continue(Ok([c, ..rest]))
      rest, "[" -> Continue(Ok([c, ..rest]))
      _, ")" -> Stop(Error(Nil))
      _, "}" -> Stop(Error(Nil))
      _, "]" -> Stop(Error(Nil))
      _, _ -> Continue(Ok(seen_brackets))
    }
  }

  result |> result.map(list.is_empty) |> result.unwrap(False)
}

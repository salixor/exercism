import gleam/int
import gleam/string

fn raindrop(
  acc: String,
  number: Int,
  divisible_by: Int,
  string_to_add: String,
) -> String {
  case number % divisible_by == 0 {
    True -> acc <> string_to_add
    False -> acc
  }
}

pub fn convert(number: Int) -> String {
  let result =
    ""
    |> raindrop(number, 3, "Pling")
    |> raindrop(number, 5, "Plang")
    |> raindrop(number, 7, "Plong")

  case string.is_empty(result) {
    True -> int.to_string(number)
    _ -> result
  }
}

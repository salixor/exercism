import gleam/int

fn make_new_string(
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
    |> make_new_string(number, 3, "Pling")
    |> make_new_string(number, 5, "Plang")
    |> make_new_string(number, 7, "Plong")

  case result {
    "" -> int.to_string(number)
    _ -> result
  }
}

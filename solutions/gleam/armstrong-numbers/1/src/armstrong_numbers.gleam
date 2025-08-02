import gleam/float
import gleam/int
import gleam/list
import gleam/result

fn is_armstrong_internal(digits: List(Int), power: Int) -> List(Int) {
  // io.debug(digits)
  case digits {
    [] -> digits
    [head, ..rest] -> [
      head
        |> int.power(power |> int.to_float)
        |> result.unwrap(0.0)
        |> float.round,
      ..is_armstrong_internal(rest, power)
    ]
  }
}

pub fn is_armstrong_number(number: Int) -> Bool {
  let assert Ok(digits) = number |> int.digits(10)
  is_armstrong_internal(digits, digits |> list.length)
  |> int.sum
  == number
}

import gleam/int
import gleam/list

fn do_power_compute(n: Int, power: Int, curr: Int) -> Int {
  case power {
    0 -> curr
    _ -> do_power_compute(n, power - 1, curr * n)
  }
}

fn int_power(n: Int, power: Int) -> Int {
  do_power_compute(n, power, 1)
}

fn is_armstrong_internal(digits: List(Int), power: Int) -> List(Int) {
  case digits {
    [] -> digits
    [head, ..rest] -> [
      head |> int_power(power),
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

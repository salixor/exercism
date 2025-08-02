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

pub fn is_armstrong_number(number: Int) -> Bool {
  let assert Ok(digits) = number |> int.digits(10)
  number
  == digits
  |> list.map(int_power(_, digits |> list.length))
  |> int.sum
}

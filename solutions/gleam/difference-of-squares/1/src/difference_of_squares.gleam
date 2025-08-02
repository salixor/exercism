fn sum_to_int_tail(n: Int, acc: Int, apply_fn: fn(Int) -> Int) -> Int {
  case n {
    0 -> acc
    _ -> sum_to_int_tail(n - 1, acc + apply_fn(n), apply_fn)
  }
}

fn sum_to_int(n: Int, apply_fn: fn(Int) -> Int) -> Int {
  sum_to_int_tail(n, 0, apply_fn)
}

pub fn square_of_sum(n: Int) -> Int {
  let s = sum_to_int(n, fn(x) { x })
  s * s
}

pub fn sum_of_squares(n: Int) -> Int {
  sum_to_int(n, fn(x) { x * x })
}

pub fn difference(n: Int) -> Int {
  square_of_sum(n) - sum_of_squares(n)
}

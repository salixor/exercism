import gleam/list

fn square(x: Int) -> Int {
  x * x
}

fn sum(a: Int, b: Int) -> Int {
  a + b
}

pub fn square_of_sum(n: Int) -> Int {
  list.range(0, n)
  |> list.fold(0, sum)
  |> square
}

pub fn sum_of_squares(n: Int) -> Int {
  list.range(0, n)
  |> list.map(square)
  |> list.fold(0, sum)
}

pub fn difference(n: Int) -> Int {
  square_of_sum(n) - sum_of_squares(n)
}

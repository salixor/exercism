import gleam/int
import gleam/list

pub fn sum(factors factors: List(Int), limit limit: Int) -> Int {
  list.range(1, limit - 1)
  |> list.filter(fn(n) { factors |> list.any(fn(f) { f > 0 && n % f == 0 }) })
  |> int.sum
}

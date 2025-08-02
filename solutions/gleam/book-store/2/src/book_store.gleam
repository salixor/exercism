import gleam/dict
import gleam/float
import gleam/int
import gleam/list

fn discount(books: List(Int), sum: Float) -> Float {
  case books |> list.filter(fn(b) { b > 0 }) |> list.sort(int.compare) {
    [] -> sum
    [a] -> sum +. int.to_float(a) *. 800.0
    [a, b] -> discount([a - 1, b - 1], sum +. 2.0 *. 760.0)
    [a, b, c] -> discount([a - 1, b - 1, c - 1], sum +. 3.0 *. 720.0)
    [a, b, c, d] -> discount([a - 1, b - 1, c - 1, d - 1], sum +. 4.0 *. 640.0)
    [a, b, c, d, e] -> {
      float.min(
        discount([a, b - 1, c - 1, d - 1, e - 1], sum +. 4.0 *. 640.0),
        discount([a - 1, b - 1, c - 1, d - 1, e - 1], sum +. 5.0 *. 600.0),
      )
    }
    _ -> sum
  }
}

pub fn lowest_price(books: List(Int)) -> Float {
  books
  |> list.group(fn(b) { b })
  |> dict.values
  |> list.map(list.length)
  |> discount(0.0)
}

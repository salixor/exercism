import gleam/list

pub fn multiples_of_factor(factor f: Int, limit l: Int) -> List(Int) {
  case l {
    n if n == 0 -> []
    _ if l % f == 0 -> [l, ..multiples_of_factor(f, l - 1)]
    _ -> multiples_of_factor(f, l - 1)
  }
}

pub fn sum(factors factors: List(Int), limit limit: Int) -> Int {
  factors
  |> list.flat_map(multiples_of_factor(_, limit - 1))
  |> list.unique
  |> list.fold(0, fn(s, acc) { s + acc })
}

import gleam/list

fn filter(list: List(t), predicate: fn(t) -> Bool, acc: List(t)) -> List(t) {
  case list {
    [] -> acc |> list.reverse
    [head, ..rest] ->
      filter(rest, predicate, case predicate(head) {
        True -> [head, ..acc]
        False -> acc
      })
  }
}

pub fn keep(list: List(t), predicate: fn(t) -> Bool) -> List(t) {
  filter(list, predicate, [])
}

pub fn discard(list: List(t), predicate: fn(t) -> Bool) -> List(t) {
  filter(list, fn(x) { !predicate(x) }, [])
}

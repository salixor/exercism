import gleam/list

fn internal(list: List(t), predicate: fn(t) -> Bool, acc: List(t)) -> List(t) {
  case list {
    [] -> acc
    [head, ..rest] ->
      case predicate(head) {
        True -> internal(rest, predicate, [acc, [head]] |> list.concat)
        False -> internal(rest, predicate, acc)
      }
  }
}

pub fn keep(list: List(t), predicate: fn(t) -> Bool) -> List(t) {
  internal(list, predicate, [])
}

pub fn discard(list: List(t), predicate: fn(t) -> Bool) -> List(t) {
  internal(list, fn(x) { !predicate(x) }, [])
}

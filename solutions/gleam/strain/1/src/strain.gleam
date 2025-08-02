import gleam/list

fn keep_internal(
  list: List(t),
  predicate: fn(t) -> Bool,
  acc: List(t),
) -> List(t) {
  case list {
    [] -> acc
    [head, ..rest] ->
      case predicate(head) {
        True -> keep_internal(rest, predicate, [acc, [head]] |> list.concat)
        False -> keep_internal(rest, predicate, acc)
      }
  }
}

pub fn keep(list: List(t), predicate: fn(t) -> Bool) -> List(t) {
  keep_internal(list, predicate, [])
}

fn discard_internal(
  list: List(t),
  predicate: fn(t) -> Bool,
  acc: List(t),
) -> List(t) {
  case list {
    [] -> acc
    [head, ..rest] ->
      case predicate(head) {
        False -> discard_internal(rest, predicate, [acc, [head]] |> list.concat)
        True -> discard_internal(rest, predicate, acc)
      }
  }
}

pub fn discard(list: List(t), predicate: fn(t) -> Bool) -> List(t) {
  discard_internal(list, predicate, [])
}

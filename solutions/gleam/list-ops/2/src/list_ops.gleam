pub fn append(first first: List(a), second second: List(a)) -> List(a) {
  case second {
    [] -> first
    [head, ..rest] -> append([head, ..{ first |> reverse }] |> reverse, rest)
  }
}

fn concat_internal(lists: List(List(a)), acc: List(a)) -> List(a) {
  case lists {
    [] -> acc
    [first, ..rest] -> concat_internal(rest, append(acc, first))
  }
}

pub fn concat(lists: List(List(a))) -> List(a) {
  concat_internal(lists, [])
}

pub fn filter(list: List(a), function: fn(a) -> Bool) -> List(a) {
  list
  |> foldl([], fn(acc, el) {
    case function(el) {
      True -> [el, ..acc]
      False -> acc
    }
  })
  |> reverse
}

pub fn length(list: List(a)) -> Int {
  foldl(list, 0, fn(acc, _) { acc + 1 })
}

pub fn map(list: List(a), function: fn(a) -> b) -> List(b) {
  list |> foldl([], fn(acc, el) { [function(el), ..acc] }) |> reverse
}

fn fold_fn(list: List(a), initial: b, function: fn(b, a) -> b) {
  case list {
    [] -> initial
    [head, ..rest] -> fold_fn(rest, function(initial, head), function)
  }
}

pub fn foldl(
  over list: List(a),
  from initial: b,
  with function: fn(b, a) -> b,
) -> b {
  fold_fn(list, initial, function)
}

pub fn foldr(
  over list: List(a),
  from initial: b,
  with function: fn(b, a) -> b,
) -> b {
  fold_fn(list |> reverse, initial, function)
}

fn reverse_internal(list: List(a), acc: List(a)) -> List(a) {
  case list {
    [] -> acc
    [head, ..rest] -> reverse_internal(rest, [head, ..acc])
  }
}

pub fn reverse(list: List(a)) -> List(a) {
  reverse_internal(list, [])
}

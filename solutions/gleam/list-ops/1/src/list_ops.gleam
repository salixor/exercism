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

fn filter_internal(
  list: List(a),
  function: fn(a) -> Bool,
  acc: List(a),
) -> List(a) {
  case list {
    [] -> acc
    [head, ..rest] ->
      case function(head) {
        True ->
          filter_internal(
            rest,
            function,
            [head, ..{ acc |> reverse }] |> reverse,
          )
        False -> filter_internal(rest, function, acc)
      }
  }
}

pub fn filter(list: List(a), function: fn(a) -> Bool) -> List(a) {
  filter_internal(list, function, [])
}

pub fn length(list: List(a)) -> Int {
  case list {
    [] -> 0
    [_, ..rest] -> 1 + length(rest)
  }
}

pub fn map(list: List(a), function: fn(a) -> b) -> List(b) {
  case list {
    [] -> []
    [head, ..rest] -> [function(head), ..map(rest, function)]
  }
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

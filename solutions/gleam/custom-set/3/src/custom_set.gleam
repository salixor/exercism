import gleam/bool
import gleam/list

pub opaque type Set(t) {
  Set(l: List(t))
}

pub fn new(members: List(t)) -> Set(t) {
  Set(members |> list.unique)
}

pub fn is_empty(set: Set(t)) -> Bool {
  set.l |> list.length == 0
}

pub fn contains(in set: Set(t), this member: t) -> Bool {
  set.l |> list.contains(member)
}

pub fn is_subset(first: Set(t), of second: Set(t)) -> Bool {
  first.l |> list.all(fn(v) { second.l |> list.contains(v) })
}

pub fn disjoint(first: Set(t), second: Set(t)) -> Bool {
  first.l |> list.any(fn(v) { second.l |> list.contains(v) }) |> bool.negate
}

pub fn is_equal(first: Set(t), to second: Set(t)) -> Bool {
  is_subset(first, second) && is_subset(second, first)
}

pub fn add(to set: Set(t), this member: t) -> Set(t) {
  case is_empty(set) || !contains(set, member) {
    True -> {
      new([member, ..set.l])
    }
    False -> set
  }
}

pub fn intersection(of first: Set(t), and second: Set(t)) -> Set(t) {
  new(first.l |> list.filter(fn(v) { list.contains(second.l, v) }))
}

pub fn difference(between first: Set(t), and second: Set(t)) -> Set(t) {
  new(first.l |> list.filter(fn(v) { !list.contains(second.l, v) }))
}

pub fn union(of first: Set(t), and second: Set(t)) -> Set(t) {
  new([first.l, second.l] |> list.concat)
}

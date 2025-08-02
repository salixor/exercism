import gleam/bool
import gleam/list

pub opaque type Set(t) {
  Set(l: List(t))
}

pub fn new(members: List(t)) -> Set(t) {
  Set(members |> list.unique)
}

pub fn is_empty(set: Set(t)) -> Bool {
  let Set(m) = set
  m |> list.length == 0
}

pub fn contains(in set: Set(t), this member: t) -> Bool {
  let Set(m) = set
  m |> list.contains(member)
}

pub fn is_subset(first: Set(t), of second: Set(t)) -> Bool {
  let #(Set(m1), Set(m2)) = #(first, second)
  m1 |> list.all(fn(v) { m2 |> list.contains(v) })
}

pub fn disjoint(first: Set(t), second: Set(t)) -> Bool {
  !is_subset(first, second) && !is_subset(second, first)
}

pub fn is_equal(first: Set(t), to second: Set(t)) -> Bool {
  is_subset(first, second) && is_subset(second, first)
}

pub fn add(to set: Set(t), this member: t) -> Set(t) {
  case is_empty(set) || !contains(set, member) {
    True -> {
      let Set(m) = set
      new([member, ..m])
    }
    False -> set
  }
}

pub fn intersection(of first: Set(t), and second: Set(t)) -> Set(t) {
  let #(Set(m1), Set(m2)) = #(first, second)
  new(m1 |> list.filter(fn(v) { m2 |> list.contains(v) }))
}

pub fn difference(between first: Set(t), and second: Set(t)) -> Set(t) {
  let #(Set(m1), Set(m2)) = #(first, second)
  new(m1 |> list.filter(fn(v) { m2 |> list.contains(v) |> bool.negate }))
}

pub fn union(of first: Set(t), and second: Set(t)) -> Set(t) {
  let #(Set(m1), Set(m2)) = #(first, second)
  new([m1, m2] |> list.concat)
}

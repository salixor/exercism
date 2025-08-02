import gleam/list
import gleam/result
import gleam/set.{type Set}
import gleam/string

pub fn new_collection(card: String) -> Set(String) {
  set.new() |> set.insert(card)
}

pub fn add_card(collection: Set(String), card: String) -> #(Bool, Set(String)) {
  #(collection |> set.contains(card), collection |> set.insert(card))
}

pub fn trade_card(
  my_card: String,
  their_card: String,
  collection: Set(String),
) -> #(Bool, Set(String)) {
  #(
    !{ collection |> set.contains(their_card) }
      && collection |> set.contains(my_card),
    collection |> set.insert(their_card) |> set.delete(my_card),
  )
}

pub fn boring_cards(collections: List(Set(String))) -> List(String) {
  collections
  |> list.fold(
    collections |> list.first |> result.unwrap(set.new()),
    set.intersection,
  )
  |> set.to_list
}

pub fn total_cards(collections: List(Set(String))) -> Int {
  collections
  |> list.fold(set.new(), fn(a, b) { set.union(a, b) })
  |> set.to_list
  |> list.length
}

pub fn shiny_cards(collection: Set(String)) -> Set(String) {
  collection |> set.filter(fn(card) { card |> string.starts_with("Shiny ") })
}

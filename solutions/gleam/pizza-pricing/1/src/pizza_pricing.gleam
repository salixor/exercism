import gleam/int
import gleam/list

pub type Pizza {
  Margherita
  Caprese
  Formaggio
  ExtraSauce(Pizza)
  ExtraToppings(Pizza)
}

fn pizza_price_tail(pizza: Pizza, price: Int) -> Int {
  case pizza {
    ExtraSauce(p) -> pizza_price_tail(p, price + 1)
    ExtraToppings(p) -> pizza_price_tail(p, price + 2)
    Margherita -> price + 7
    Caprese -> price + 9
    Formaggio -> price + 10
  }
}

pub fn pizza_price(pizza: Pizza) -> Int {
  pizza_price_tail(pizza, 0)
}

pub fn order_price(order: List(Pizza)) -> Int {
  case order |> list.length {
    1 -> 3 + { order |> list.map(pizza_price) |> int.sum }
    2 -> 2 + { order |> list.map(pizza_price) |> int.sum }
    _ -> order |> list.map(pizza_price) |> int.sum
  }
}

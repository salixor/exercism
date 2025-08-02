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
  case order {
    [] -> 0
    [a] -> 3 + pizza_price(a)
    [a, b] -> 2 + pizza_price(a) + pizza_price(b)
    [a, b, c] -> pizza_price(a) + pizza_price(b) + pizza_price(c)
    [a, ..rest] -> pizza_price(a) + order_price(rest)
  }
}

import gleam/result

pub type Resistance {
  Resistance(unit: String, value: Int)
}

fn int_pow(n: Int, power: Int) -> Int {
  case power {
    0 -> 1
    1 -> n
    _ -> n * int_pow(n, power - 1)
  }
}

pub fn color_value(color: String) -> Result(Int, Nil) {
  case color {
    "black" -> Ok(0)
    "brown" -> Ok(1)
    "red" -> Ok(2)
    "orange" -> Ok(3)
    "yellow" -> Ok(4)
    "green" -> Ok(5)
    "blue" -> Ok(6)
    "violet" -> Ok(7)
    "grey" -> Ok(8)
    "white" -> Ok(9)
    _ -> Error(Nil)
  }
}

pub fn value(colors: List(String)) -> Result(Int, Nil) {
  case colors {
    [c1, c2, c3, ..] -> {
      use v1 <- result.try(color_value(c1))
      use v2 <- result.try(color_value(c2))
      use v3 <- result.try(color_value(c3))
      Ok({ 10 * v1 + v2 } * int_pow(10, v3))
    }
    _ -> Error(Nil)
  }
}

pub fn label(colors: List(String)) -> Result(Resistance, Nil) {
  use v <- result.try(value(colors))
  case v {
    0 -> Ok(Resistance("ohms", 0))
    x if x % 1_000_000_000 == 0 -> Ok(Resistance("gigaohms", v / 1_000_000_000))
    x if x % 1_000_000 == 0 -> Ok(Resistance("megaohms", v / 1_000_000))
    x if x % 1000 == 0 -> Ok(Resistance("kiloohms", v / 1000))
    _ -> Ok(Resistance("ohms", v))
  }
}

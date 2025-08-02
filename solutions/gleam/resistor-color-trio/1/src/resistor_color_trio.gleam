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

pub fn color_value(color: String) -> Int {
  case color {
    "black" -> 0
    "brown" -> 1
    "red" -> 2
    "orange" -> 3
    "yellow" -> 4
    "green" -> 5
    "blue" -> 6
    "violet" -> 7
    "grey" -> 8
    "white" -> 9
    _ -> -1
  }
}

pub fn value(colors: List(String)) -> Result(Int, Nil) {
  case colors {
    [c1, c2, c3, ..] -> {
      let numeric_value = 10 * { c1 |> color_value } + { c2 |> color_value }
      let tens = int_pow(10, c3 |> color_value)
      Ok(numeric_value * tens)
    }
    _ -> Error(Nil)
  }
}

pub fn label(colors: List(String)) -> Result(Resistance, Nil) {
  value(colors)
  |> result.try(fn(v) {
    Ok(case v {
      0 -> Resistance("ohms", 0)
      x if x % 1_000_000_000 == 0 -> Resistance("gigaohms", v / 1_000_000_000)
      x if x % 1_000_000 == 0 -> Resistance("megaohms", v / 1_000_000)
      x if x % 1000 == 0 -> Resistance("kiloohms", v / 1000)
      _ -> Resistance("ohms", v)
    })
  })
}

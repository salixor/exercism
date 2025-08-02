pub fn today(days: List(Int)) -> Int {
  case days {
    [today, ..] -> today
    _ -> 0
  }
}

pub fn increment_day_count(days: List(Int)) -> List(Int) {
  case days {
    [today, ..rest] -> [today + 1, ..rest]
    _ -> [1]
  }
}

pub fn has_day_without_birds(days: List(Int)) -> Bool {
  case days {
    [today, ..rest] -> today == 0 || has_day_without_birds(rest)
    _ -> False
  }
}

pub fn total(days: List(Int)) -> Int {
  case days {
    [today, ..rest] -> today + total(rest)
    _ -> 0
  }
}

pub fn busy_days(days: List(Int)) -> Int {
  case days {
    [today, ..rest] ->
      case today >= 5 {
        True -> 1 + busy_days(rest)
        _ -> busy_days(rest)
      }
    _ -> 0
  }
}

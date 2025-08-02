import gleam/string

pub fn hey(remark: String) -> String {
  case string.trim(string.reverse(remark)) {
    "" -> "Fine. Be that way!"
    "?" <> _ -> {
      case
        string.uppercase(remark) == remark && string.lowercase(remark) != remark
      {
        True -> "Calm down, I know what I'm doing!"
        False -> "Sure."
      }
    }
    _ -> {
      case
        string.uppercase(remark) == remark && string.lowercase(remark) != remark
      {
        True -> "Whoa, chill out!"
        False -> "Whatever."
      }
    }
  }
}

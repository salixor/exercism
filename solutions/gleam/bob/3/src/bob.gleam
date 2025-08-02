import gleam/string

fn is_string_uppercase(s: String) -> Bool {
  string.uppercase(s) == s && string.lowercase(s) != s
}

pub fn hey(remark: String) -> String {
  case string.trim(string.reverse(remark)) {
    "" -> "Fine. Be that way!"
    "?" <> _ -> {
      case is_string_uppercase(remark) {
        True -> "Calm down, I know what I'm doing!"
        False -> "Sure."
      }
    }
    _ -> {
      case is_string_uppercase(remark) {
        True -> "Whoa, chill out!"
        False -> "Whatever."
      }
    }
  }
}

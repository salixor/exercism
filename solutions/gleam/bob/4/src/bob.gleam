import gleam/string

fn is_string_uppercase(s: String) -> Bool {
  string.uppercase(s) == s && string.lowercase(s) != s
}

fn is_question(s: String) -> Bool {
  string.ends_with(s, "?")
}

pub fn hey(remark: String) -> String {
  let remark = string.trim(remark)
  case remark {
    "" -> "Fine. Be that way!"
    _ -> {
      case is_question(remark), is_string_uppercase(remark) {
        True, True -> "Calm down, I know what I'm doing!"
        True, False -> "Sure."
        False, True -> "Whoa, chill out!"
        False, False -> "Whatever."
      }
    }
  }
}

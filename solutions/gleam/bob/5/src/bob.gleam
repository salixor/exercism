import gleam/string

fn is_string_uppercase(s: String) -> Bool {
  string.uppercase(s) == s && string.lowercase(s) != s
}

fn is_question(s: String) -> Bool {
  string.ends_with(s, "?")
}

pub fn hey(remark: String) -> String {
  let remark = string.trim(remark)
  case
    string.is_empty(remark),
    is_question(remark),
    is_string_uppercase(remark)
  {
    True, _, _ -> "Fine. Be that way!"
    _, True, True -> "Calm down, I know what I'm doing!"
    _, True, False -> "Sure."
    _, False, True -> "Whoa, chill out!"
    _, False, False -> "Whatever."
  }
}

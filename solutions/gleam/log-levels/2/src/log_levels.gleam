import gleam/string

fn extract(log_line: String) -> #(String, String) {
  case string.split(log_line, ":") {
    [l, m] -> {
      let level = string.drop_left(string.drop_right(l, 1), 1)
      #(string.lowercase(level), string.trim(m))
    }
    _ -> #("", "")
  }
}

pub fn message(log_line: String) -> String {
  extract(log_line).1
}

pub fn log_level(log_line: String) -> String {
  extract(log_line).0
}

pub fn reformat(log_line: String) -> String {
  let #(level, message) = extract(log_line)
  message <> " (" <> level <> ")"
}

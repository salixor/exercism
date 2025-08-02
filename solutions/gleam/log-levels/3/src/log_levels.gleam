import gleam/string

pub type Log {
  L(message: String, level: String)
}

fn extract(log_line: String) -> Log {
  case string.split(log_line, ":") {
    [l, m] -> {
      let level = string.drop_left(string.drop_right(l, 1), 1)
      L(string.trim(m), string.lowercase(level))
    }
    _ -> L("", "")
  }
}

pub fn message(log_line: String) -> String {
  extract(log_line).message
}

pub fn log_level(log_line: String) -> String {
  extract(log_line).level
}

pub fn reformat(log_line: String) -> String {
  let L(message, level) = extract(log_line)
  message <> " (" <> level <> ")"
}

import gleam/option.{Some}
import gleam/regex.{Match}

pub fn is_valid_line(line: String) -> Bool {
  let assert Ok(re) = regex.from_string("^\\[(?:ERROR|INFO|WARNING|DEBUG)\\]")
  regex.check(re, line)
}

pub fn split_line(line: String) -> List(String) {
  let assert Ok(re) = regex.from_string("<[~*=-]*>")
  regex.split(re, line)
}

pub fn tag_with_user_name(line: String) -> String {
  let assert Ok(re) = regex.from_string("^\\[.*\\]\\s.*User\\s+(\\S+).*")
  case regex.scan(re, line) {
    [Match(submatches: [Some(uname)], ..)] -> "[USER] " <> uname <> " " <> line
    _ -> line
  }
}

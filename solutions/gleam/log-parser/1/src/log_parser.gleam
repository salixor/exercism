import gleam/io
import gleam/list
import gleam/option.{Some}
import gleam/regex
import gleam/string

pub fn is_valid_line(line: String) -> Bool {
  let assert Ok(re) = regex.from_string("^\\[(?:ERROR|INFO|WARNING|DEBUG)\\]")
  regex.check(re, line)
}

pub fn split_line(line: String) -> List(String) {
  let assert Ok(re) = regex.from_string("<[~*=-]*>")
  regex.split(re, line)
}

pub fn tag_with_user_name(line: String) -> String {
  let assert Ok(re) =
    regex.from_string("^\\[(?:ERROR|INFO|WARN|DEBUG)\\]\\s.*User\\s+(\\S+).*")
  case regex.scan(re, line) {
    [match] -> {
      io.debug(match)
      case match.submatches |> list.first() {
        Ok(Some(username)) ->
          "[USER] " <> username |> string.trim <> " " <> line
        _ -> line
      }
    }
    _ -> line
  }
}

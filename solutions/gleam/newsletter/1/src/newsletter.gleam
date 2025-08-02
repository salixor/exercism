import gleam/list
import gleam/result
import gleam/string
import simplifile

pub fn read_emails(path: String) -> Result(List(String), Nil) {
  path
  |> simplifile.read
  |> result.map(fn(s) { s |> string.trim |> string.split("\n") })
  |> result.map_error(fn(_) { Nil })
}

pub fn create_log_file(path: String) -> Result(Nil, Nil) {
  path
  |> simplifile.create_file
  |> result.map_error(fn(_) { Nil })
}

pub fn log_sent_email(path: String, email: String) -> Result(Nil, Nil) {
  path
  |> simplifile.append(email <> "\n")
  |> result.map_error(fn(_) { Nil })
}

pub fn send_newsletter(
  emails_path: String,
  log_path: String,
  send_email: fn(String) -> Result(Nil, Nil),
) -> Result(Nil, Nil) {
  case emails_path |> read_emails {
    Ok(emails) -> {
      case log_path |> create_log_file {
        Ok(_) -> {
          emails
          |> list.each(fn(email) {
            email
            |> send_email
            |> result.try(fn(_) { log_sent_email(log_path, email) })
          })
          Ok(Nil)
        }
        _ -> Error(Nil)
      }
    }
    Error(_) -> Error(Nil)
  }
}

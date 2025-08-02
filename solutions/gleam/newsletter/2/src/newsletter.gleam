import gleam/list
import gleam/result
import gleam/string
import simplifile

pub fn read_emails(path: String) -> Result(List(String), Nil) {
  path
  |> simplifile.read
  |> result.map(fn(s) { s |> string.trim |> string.split("\n") })
  |> result.nil_error
}

pub fn create_log_file(path: String) -> Result(Nil, Nil) {
  path
  |> simplifile.create_file
  |> result.nil_error
}

pub fn log_sent_email(path: String, email: String) -> Result(Nil, Nil) {
  path
  |> simplifile.append(email <> "\n")
  |> result.nil_error
}

pub fn send_newsletter(
  emails_path: String,
  log_path: String,
  send_email: fn(String) -> Result(Nil, Nil),
) -> Result(Nil, Nil) {
  use _ <- result.try(log_path |> create_log_file)
  use emails <- result.try(emails_path |> read_emails)
  use email <- list.try_each(emails)

  email
  |> send_email
  |> result.try(fn(_) { log_sent_email(log_path, email) })
  |> result.try_recover(fn(_) { Ok(Nil) })
}

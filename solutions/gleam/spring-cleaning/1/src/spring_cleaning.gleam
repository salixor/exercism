import gleam/list
import gleam/string

pub fn extract_error(problem: Result(a, b)) -> b {
  let assert Error(b) = problem
  b
}

pub fn remove_team_prefix(team: String) -> String {
  let assert Ok(r) = team |> string.split(" ") |> list.first
  r
}

pub fn split_region_and_team(combined: String) -> #(String, String) {
  let assert [region, team] = combined |> string.split(",") |> list.take(2)
  let team_no_prefix = team |> string.replace("Team ", "")
  #(region, team_no_prefix)
}

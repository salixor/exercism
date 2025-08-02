import gleam/list
import gleam/string

pub fn extract_error(problem: Result(a, b)) -> b {
  let assert Error(b) = problem
  b
}

pub fn remove_team_prefix(team: String) -> String {
  let assert "Team " <> r = team
  r
}

pub fn split_region_and_team(combined: String) -> #(String, String) {
  let assert [region, team] = combined |> string.split(",") |> list.take(2)
  #(region, team |> remove_team_prefix)
}

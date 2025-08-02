import gleam/io
import gleam/result

pub fn with_retry(experiment: fn() -> Result(t, e)) -> Result(t, e) {
  case experiment() {
    Ok(v) -> Ok(v)
    Error(_) ->
      case experiment() {
        Ok(v) -> Ok(v)
        Error(e) -> Error(e)
      }
  }
}

pub fn record_timing(
  time_logger: fn() -> Nil,
  experiment: fn() -> Result(t, e),
) -> Result(t, e) {
  let _ = time_logger()
  let c = experiment()
  let _ = time_logger()
  c
}

pub fn run_experiment(
  name: String,
  setup: fn() -> Result(t, e),
  action: fn(t) -> Result(u, e),
  record: fn(t, u) -> Result(v, e),
) -> Result(#(String, v), e) {
  use s <- result.try(setup())
  use a <- result.try(action(s))
  use r <- result.try(record(s, a))
  Ok(#(name, r))
}

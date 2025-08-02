import gleam/list

pub fn new_list() -> List(String) {
  []
}

pub fn existing_list() -> List(String) {
  ["Gleam", "Go", "TypeScript"]
}

pub fn add_language(languages: List(String), language: String) -> List(String) {
  [language, ..languages]
}

fn length(l: List(a)) -> Int {
  case l {
    [_, ..rest] -> 1 + length(rest)
    _ -> 0
  }
}

pub fn count_languages(languages: List(String)) -> Int {
  length(languages)
}

fn reverse(l: List(a)) -> List(a) {
  case l {
    [head, ..rest] -> list.concat([reverse(rest), [head]])
    _ -> []
  }
}

pub fn reverse_list(languages: List(String)) -> List(String) {
  list.reverse(languages)
}

pub fn exciting_list(languages: List(String)) -> Bool {
  case languages {
    ["Gleam", ..] -> True
    [_, "Gleam"] -> True
    [_, "Gleam", _] -> True
    _ -> False
  }
}

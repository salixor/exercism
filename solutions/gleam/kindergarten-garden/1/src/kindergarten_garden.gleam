import gleam/list
import gleam/result
import gleam/string

pub type Student {
  Alice
  Bob
  Charlie
  David
  Eve
  Fred
  Ginny
  Harriet
  Ileana
  Joseph
  Kincaid
  Larry
}

pub type Plant {
  Radishes
  Clover
  Violets
  Grass
}

fn str_to_plant(s: String) -> Plant {
  case s {
    "R" -> Radishes
    "C" -> Clover
    "V" -> Violets
    "G" -> Grass
    _ -> Radishes
  }
}

fn student_to_index(s: Student) -> Int {
  case s {
    Alice -> 1
    Bob -> 2
    Charlie -> 3
    David -> 4
    Eve -> 5
    Fred -> 6
    Ginny -> 7
    Harriet -> 8
    Ileana -> 9
    Joseph -> 10
    Kincaid -> 11
    Larry -> 12
  }
}

fn convert_str_to_list(l: List(String)) -> List(Plant) {
  case l {
    [] -> []
    [head, ..rest] -> [head |> str_to_plant, ..convert_str_to_list(rest)]
  }
}

pub fn plants(diagram: String, student: Student) -> List(Plant) {
  diagram
  |> string.split("\n")
  |> list.map(fn(x) { x |> string.split("") |> convert_str_to_list })
}

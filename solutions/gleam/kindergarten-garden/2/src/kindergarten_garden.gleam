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

fn letter_to_plant(s: String) -> Result(Plant, Nil) {
  case s {
    "R" -> Ok(Radishes)
    "C" -> Ok(Clover)
    "V" -> Ok(Violets)
    "G" -> Ok(Grass)
    _ -> Error(Nil)
  }
}

fn line_to_plants(line: String) -> Result(List(Plant), Nil) {
  line |> string.to_graphemes |> list.try_map(letter_to_plant)
}

pub fn chunk_line(line: String) -> List(List(Plant)) {
  line
  |> line_to_plants
  |> result.unwrap([])
  |> list.sized_chunk(2)
}

pub fn plants(diagram: String, student: Student) -> List(Plant) {
  let assert [l1, l2] =
    diagram
    |> string.split("\n")
  let plants = list.map2(l1 |> chunk_line, l2 |> chunk_line, list.append)

  [
    Alice,
    Bob,
    Charlie,
    David,
    Eve,
    Fred,
    Ginny,
    Harriet,
    Ileana,
    Joseph,
    Kincaid,
    Larry,
  ]
  |> list.zip(plants)
  |> list.key_find(student)
  |> result.unwrap([])
}

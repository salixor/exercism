import gleam/result

pub fn to_rna(dna: String) -> Result(String, Nil) {
  case dna {
    "" -> Ok("")
    "G" -> Ok("C")
    "C" -> Ok("G")
    "T" -> Ok("A")
    "A" -> Ok("U")
    "G" <> rest -> to_rna(rest) |> result.try(fn(r) { Ok("C" <> r) })
    "C" <> rest -> to_rna(rest) |> result.try(fn(r) { Ok("G" <> r) })
    "T" <> rest -> to_rna(rest) |> result.try(fn(r) { Ok("A" <> r) })
    "A" <> rest -> to_rna(rest) |> result.try(fn(r) { Ok("U" <> r) })
    _ -> Error(Nil)
  }
}

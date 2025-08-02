import gleam/result

pub type Nucleotide {
  Adenine
  Cytosine
  Guanine
  Thymine
}

pub fn encode_nucleotide(nucleotide: Nucleotide) -> Int {
  case nucleotide {
    Adenine -> 0
    Cytosine -> 1
    Guanine -> 2
    Thymine -> 3
  }
}

pub fn decode_nucleotide(nucleotide: Int) -> Result(Nucleotide, Nil) {
  case nucleotide {
    0 -> Ok(Adenine)
    1 -> Ok(Cytosine)
    2 -> Ok(Guanine)
    3 -> Ok(Thymine)
    _ -> Error(Nil)
  }
}

pub fn encode(dna: List(Nucleotide)) -> BitArray {
  case dna {
    [] -> <<>>
    [head, ..rest] -> <<{ head |> encode_nucleotide }, encode(rest):bits>>
  }
}

pub fn decode(dna: BitArray) -> Result(List(Nucleotide), Nil) {
  case dna {
    <<value>> -> value |> decode_nucleotide |> result.try(fn(x) { Ok([x]) })
    <<value, rest:bits>> ->
      value
      |> decode_nucleotide
      |> result.try(fn(x) {
        case rest |> decode {
          Ok(r) -> Ok([x, ..r])
          _ -> Error(Nil)
        }
      })
    _ -> Ok([])
  }
}

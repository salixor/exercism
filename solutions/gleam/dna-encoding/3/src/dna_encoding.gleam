import gleam/bit_array
import gleam/list
import gleam/result

pub type Nucleotide {
  Adenine
  Cytosine
  Guanine
  Thymine
}

pub fn encode_nucleotide(nucleotide: Nucleotide) -> Int {
  case nucleotide {
    Adenine -> 0b00
    Cytosine -> 0b01
    Guanine -> 0b10
    Thymine -> 0b11
  }
}

pub fn decode_nucleotide(nucleotide: Int) -> Result(Nucleotide, Nil) {
  case nucleotide {
    0b00 -> Ok(Adenine)
    0b01 -> Ok(Cytosine)
    0b10 -> Ok(Guanine)
    0b11 -> Ok(Thymine)
    _ -> Error(Nil)
  }
}

pub fn encode(dna: List(Nucleotide)) -> BitArray {
  dna
  |> list.map(fn(nucleotide) { <<encode_nucleotide(nucleotide):2>> })
  |> bit_array.concat
}

pub fn decode(dna: BitArray) -> Result(List(Nucleotide), Nil) {
  case dna {
    <<>> -> Ok([])
    <<nucleotide:2, rest:bits>> ->
      nucleotide
      |> decode_nucleotide
      |> result.map(fn(n) { rest |> decode |> result.map(fn(t) { [n, ..t] }) })
      |> result.flatten
    _ -> Error(Nil)
  }
}

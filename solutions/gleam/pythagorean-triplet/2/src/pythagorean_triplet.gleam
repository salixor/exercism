pub type Triplet {
  Triplet(Int, Int, Int)
}

fn find_triplets(
  sum: Int,
  a: Int,
  b: Int,
  triplets: List(Triplet),
) -> List(Triplet) {
  case a, b, sum - a - b {
    a, _, _ if a == sum -> triplets
    _, b, _ if b == sum -> find_triplets(sum, a + 1, a + 2, triplets)
    _, _, c if a * a + b * b == c * c -> [
      Triplet(a, b, c),
      ..find_triplets(sum, a, b + 1, triplets)
    ]
    _, _, _ -> find_triplets(sum, a, b + 1, triplets)
  }
}

pub fn triplets_with_sum(sum: Int) -> List(Triplet) {
  find_triplets(sum, 1, 2, [])
}

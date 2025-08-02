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
    a, b, c if a * a + b * b == c * c -> [Triplet(a, b, c), ..triplets]
    a, b, _ if b <= sum / 2 -> find_triplets(sum, a, b + 1, triplets)
    a, _, _ if a <= sum / 3 -> find_triplets(sum, a + 1, a + 2, triplets)
    a, b, c if a >= b || b >= c -> triplets
    _, _, _ -> triplets
  }
}

pub fn triplets_with_sum(sum: Int) -> List(Triplet) {
  find_triplets(sum, 1, 2, [])
}

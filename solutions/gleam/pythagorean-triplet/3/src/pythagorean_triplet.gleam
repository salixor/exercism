pub type Triplet {
  Triplet(Int, Int, Int)
}

fn find_triplets(sum: Int, a: Int, b: Int) -> List(Triplet) {
  case a, b, sum - a - b {
    a, _, _ if a == sum -> []
    _, b, _ if b == sum -> find_triplets(sum, a + 1, a + 2)
    _, _, c if a * a + b * b == c * c -> [Triplet(a, b, c), ..find_triplets(sum, a, b + 1)]
    _, _, _ -> find_triplets(sum, a, b + 1)
  }
}

pub fn triplets_with_sum(sum: Int) -> List(Triplet) {
  find_triplets(sum, 1, 2)
}

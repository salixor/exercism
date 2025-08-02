import gleam/float

fn triangle_inequality(a: Float, b: Float, c: Float) -> Bool {
  a != 0.0
  && b != 0.0
  && c != 0.0
  && float.absolute_value(a -. b) >=. c
  || c >=. a +. b
}

fn not_all_side_equals(a: Float, b: Float, c: Float) -> Bool {
  a != b && b != c && a != c
}

pub fn equilateral(a: Float, b: Float, c: Float) -> Bool {
  !triangle_inequality(a, b, c) && a == b && b == c
}

pub fn isosceles(a: Float, b: Float, c: Float) -> Bool {
  !triangle_inequality(a, b, c) && !not_all_side_equals(a, b, c)
}

pub fn scalene(a: Float, b: Float, c: Float) -> Bool {
  !triangle_inequality(a, b, c) && not_all_side_equals(a, b, c)
}

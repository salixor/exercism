pub fn convert(number: Int) -> String {
  case number {
    n if n - 1000 >= 0 -> "M" <> convert(n - 1000)
    n if n - 900 >= 0 -> "CM" <> convert(n - 900)
    n if n - 500 >= 0 -> "D" <> convert(n - 500)
    n if n - 400 >= 0 -> "CD" <> convert(n - 400)
    n if n - 100 >= 0 -> "C" <> convert(n - 100)
    n if n - 90 >= 0 -> "XC" <> convert(n - 90)
    n if n - 50 >= 0 -> "L" <> convert(n - 50)
    n if n - 40 >= 0 -> "XL" <> convert(n - 40)
    n if n - 10 >= 0 -> "X" <> convert(n - 10)
    n if n - 9 >= 0 -> "IX" <> convert(n - 9)
    n if n - 5 >= 0 -> "V" <> convert(n - 5)
    n if n - 4 >= 0 -> "IV" <> convert(n - 4)
    n if n - 1 >= 0 -> "I" <> convert(n - 1)
    _ -> ""
  }
}

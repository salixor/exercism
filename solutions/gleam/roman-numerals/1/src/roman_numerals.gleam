import gleam/io

fn make_roman(number: Int) -> String {
  io.debug(number)
  case number {
    1 -> "I"
    4 -> "IV"
    5 -> "V"
    9 -> "IX"
    10 -> "X"
    40 -> "XL"
    50 -> "L"
    90 -> "XC"
    100 -> "C"
    400 -> "CD"
    500 -> "D"
    900 -> "CM"
    1000 -> "M"
    _ -> ""
  }
}

fn doaaa(acc: String, number: Int, current_size: Int) -> String {
  convert_internal(
    make_roman(number - current_size) <> acc,
    number - current_size,
  )
}

fn convert_internal(acc: String, number: Int) -> String {
  case number - 1000 >= 0 {
    True -> doaaa(acc, number, 1000)
    False ->
      case number - 500 >= 0 {
        True -> doaaa(acc, number, 500)
        False ->
          case number - 100 >= 0 {
            True -> doaaa(acc, number, 100)
            False ->
              case number - 50 >= 0 {
                True -> doaaa(acc, number, 50)
                False ->
                  case number - 10 >= 0 {
                    True -> doaaa(acc, number, 10)
                    False ->
                      case number - 5 >= 0 {
                        True -> doaaa(acc, number, 5)
                        False ->
                          case number - 1 >= 0 {
                            True -> doaaa(acc, number, 1)
                            False -> acc
                          }
                      }
                  }
              }
          }
      }
  }
}

pub fn convert(number: Int) -> String {
  io.debug(number)
  io.debug("aaa")
  convert_internal("", number)
}

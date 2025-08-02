import gleam/int
import gleam/io
import gleam/list

pub const book_price: Float = 8.0

type Book =
  Int

type Bundle =
  List(Book)

fn lowest_price_internal(
  books: List(Book),
  bundles_all: List(List(Bundle)),
) -> List(List(Bundle)) {
  io.debug("RUNNING")
  io.debug(bundles_all)
  case books {
    [book, ..rest] -> {
      lowest_price_internal(
        rest,
        [[[book]], ..bundles_all]
          |> list.map(fn(bundles) {
            io.debug(bundles)
            bundles
            |> list.filter_map(fn(bundle) {
              io.debug(bundle |> list.contains(book))
              case bundle |> list.contains(book) {
                True -> Ok(bundle)
                False -> Ok([book, ..bundle])
              }
            })
          }),
      )
    }
    _ -> {
      io.debug("finitio")
      bundles_all
    }
  }
}

fn get_discount(bundle: Bundle) -> Int {
  case bundle |> list.length {
    5 -> 25
    4 -> 20
    3 -> 10
    2 -> 5
    _ -> 0
  }
}

fn bundle_price(bundle: Bundle) -> Float {
  int.to_float(100 - get_discount(bundle)) *. book_price
}

pub fn lowest_price(books: List(Book)) -> Float {
  case books {
    [] -> 0.0
    [_] -> book_price *. 100.0
    [head, ..rest] -> {
      let bundles = lowest_price_internal(rest, [[[head]]])
      // io.debug(bundles |> list.map(bundle_price))
      io.debug(bundles)
      0.0
    }
  }
}

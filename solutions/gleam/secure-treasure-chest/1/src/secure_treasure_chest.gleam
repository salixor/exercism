import gleam/string

pub opaque type TreasureChest(tr) {
  TreasureChest(password: String, treasure: tr)
}

pub fn create(
  password: String,
  contents: treasure,
) -> Result(TreasureChest(treasure), String) {
  case password |> string.length {
    x if x < 8 -> Error("Password must be at least 8 characters long")
    _ -> Ok(TreasureChest(password, contents))
  }
}

pub fn open(
  chest: TreasureChest(treasure),
  password: String,
) -> Result(treasure, String) {
  case chest {
    TreasureChest(p, contents) if p == password -> Ok(contents)
    _ -> Error("Incorrect password")
  }
}

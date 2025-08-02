pub type TreasureChest(tr) {
  TreasureChest(password: String, treasure: tr)
}

pub type UnlockResult(u) {
  Unlocked(u)
  WrongPassword
}

pub fn get_treasure(
  chest: TreasureChest(treasure),
  password: String,
) -> UnlockResult(treasure) {
  case chest.password == password {
    True -> Unlocked(chest.treasure)
    False -> WrongPassword
  }
}

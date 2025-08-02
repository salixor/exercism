import gleam/int
import gleam/option.{type Option, None, Some}

pub type Player {
  Player(name: Option(String), level: Int, health: Int, mana: Option(Int))
}

pub fn introduce(player: Player) -> String {
  case player.name {
    Some(n) -> n
    _ -> "Mighty Magician"
  }
}

pub fn revive(player: Player) -> Option(Player) {
  case player.health > 0 {
    True -> None
    False ->
      case player.level >= 10 {
        True -> Some(Player(..player, health: 100, mana: Some(100)))
        False -> Some(Player(..player, health: 100))
      }
  }
}

pub fn cast_spell(player: Player, cost: Int) -> #(Player, Int) {
  case player.mana {
    Some(mana) ->
      case mana >= cost {
        True -> #(Player(..player, mana: Some(mana - cost)), cost * 2)
        False -> #(player, 0)
      }
    None -> #(Player(..player, health: int.max(player.health - cost, 0)), 0)
  }
}

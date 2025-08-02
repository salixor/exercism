import gleam/list
import gleam/string

pub type Robot {
  Robot(direction: Direction, position: Position)
}

pub type Direction {
  North
  East
  South
  West
}

pub type Position {
  Position(x: Int, y: Int)
}

pub fn create(direction: Direction, position: Position) -> Robot {
  Robot(direction, position)
}

pub fn step(robot: Robot, instruction: String) -> Robot {
  case instruction, robot {
    "R", Robot(North, position) -> create(East, position)
    "R", Robot(East, position) -> create(South, position)
    "R", Robot(South, position) -> create(West, position)
    "R", Robot(West, position) -> create(North, position)
    "L", Robot(North, position) -> create(West, position)
    "L", Robot(West, position) -> create(South, position)
    "L", Robot(South, position) -> create(East, position)
    "L", Robot(East, position) -> create(North, position)
    "A", Robot(North, Position(x, y)) -> create(North, Position(x: x, y: y + 1))
    "A", Robot(South, Position(x, y)) -> create(South, Position(x: x, y: y - 1))
    "A", Robot(East, Position(x, y)) -> create(East, Position(x: x + 1, y: y))
    "A", Robot(West, Position(x, y)) -> create(West, Position(x: x - 1, y: y))
    _, _ -> robot
  }
}

pub fn move(
  direction: Direction,
  position: Position,
  instructions: String,
) -> Robot {
  instructions
  |> string.to_graphemes
  |> list.fold(create(direction, position), step)
}

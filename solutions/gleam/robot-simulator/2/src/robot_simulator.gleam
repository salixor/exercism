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

pub fn move(
  direction: Direction,
  position: Position,
  instructions: String,
) -> Robot {
  instructions
  |> string.to_graphemes
  |> list.fold(create(direction, position), fn(robot, instruction) {
    case instruction {
      "R" ->
        case robot.direction {
          North -> create(East, robot.position)
          East -> create(South, robot.position)
          South -> create(West, robot.position)
          West -> create(North, robot.position)
        }
      "L" ->
        case robot.direction {
          North -> create(West, robot.position)
          West -> create(South, robot.position)
          South -> create(East, robot.position)
          East -> create(North, robot.position)
        }
      "A" ->
        case robot.direction {
          North ->
            create(
              robot.direction,
              Position(..robot.position, y: robot.position.y + 1),
            )
          South ->
            create(
              robot.direction,
              Position(..robot.position, y: robot.position.y - 1),
            )
          East ->
            create(
              robot.direction,
              Position(..robot.position, x: robot.position.x + 1),
            )
          West ->
            create(
              robot.direction,
              Position(..robot.position, x: robot.position.x - 1),
            )
        }
      _ -> robot
    }
  })
}

const minutes_in_oven = 40

const time_for_layer = 2

// Please define the expected_minutes_in_oven function
pub fn expected_minutes_in_oven() {
  minutes_in_oven
}

// Please define the remaining_minutes_in_oven function
pub fn remaining_minutes_in_oven(time_in_oven: Int) -> Int {
  expected_minutes_in_oven() - time_in_oven
}

// Please define the preparation_time_in_minutes function
pub fn preparation_time_in_minutes(layers: Int) -> Int {
  layers * time_for_layer
}

// Please define the total_time_in_minutes function
pub fn total_time_in_minutes(layers: Int, time_in_oven: Int) -> Int {
  time_in_oven + preparation_time_in_minutes(layers)
}

// Please define the alarm function
pub fn alarm() -> String {
  "Ding!"
}

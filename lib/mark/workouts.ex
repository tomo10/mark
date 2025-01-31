defmodule Mark.Workouts do
  use Ash.Domain

  resources do
    resource Mark.Workouts.Workout
  end
end

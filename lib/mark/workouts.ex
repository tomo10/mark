defmodule Mark.Workouts do
  use Ash.Domain

  resources do
    resource Mark.Workouts.Workout
    resource Mark.Workouts.Set
    resource Mark.Workouts.Round

    resource Mark.Workouts.Exercise do
      define :create_exercise, action: :create
      define :read_exercises, action: :read
    end
  end
end

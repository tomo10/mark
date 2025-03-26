defmodule Mark.Workouts do
  use Ash.Domain

  resources do
    resource Mark.Workouts.Workout do
      define :create_workout, action: :create
      define :get_workout_by_id, action: :read, get_by: :id
      define :read_workouts, action: :read
    end

    resource Mark.Workouts.Set do
      define :create_set, action: :create
    end

    resource Mark.Workouts.Round do
      define :create_round, action: :create
    end

    resource Mark.Workouts.Exercise do
      define :create_exercise, action: :create
      define :read_exercises, action: :read
    end
  end
end

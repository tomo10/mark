# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Mark.Repo.insert!(%Mark.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Mark.Workouts

exercises = [
  %{name: "Bench Press", equipment: "Barbell"},
  %{name: "Deadlift", equipment: "Barbell"},
  %{name: "Squat", equipment: "Barbell"},
  %{name: "Overhead Press", equipment: "Barbell"},
  %{name: "Barbell Row", equipment: "Barbell"},
  %{name: "Pull-Up", equipment: "Bodyweight"},
  %{name: "Dip", equipment: "Bodyweight"},
  %{name: "Bicep Curl", equipment: "Dumbbell"},
  %{name: "Tricep Extension", equipment: "Dumbbell"},
  %{name: "Leg Press", equipment: "Machine"},
  %{name: "Lunge", equipment: "Bodyweight"},
  %{name: "Calf Raise", equipment: "Bodyweight"},
  %{name: "Cable Fly", equipment: "Cable Machine"},
  %{name: "Lat Pulldown", equipment: "Cable Machine"},
  %{name: "Shrug", equipment: "Dumbbell"},
  %{name: "Dumbbell Fly", equipment: "Dumbbell"},
  %{name: "Chest Press", equipment: "Machine"},
  %{name: "Seated Row", equipment: "Machine"},
  %{name: "Crunches", equipment: "Bodyweight"},
  %{name: "Plank", equipment: "Bodyweight"}
]

Enum.each(exercises, fn attrs ->
  case Workouts.create_exercise(attrs) do
    {:ok, exercise} ->
      IO.puts("Created exercise: #{exercise.name}")

    {:error, error} ->
      IO.inspect(error, label: "Error creating exercise")
  end
end)

# first run this seed file and check it works
# then build out more rounds, then sets. then you'll have a whole workout with assocs

w1 = Workouts.create_workout(%{name: "Mark"})

round = WWorkouts.create_round(%{round_number: 1, rest_period: 60, workout_id: w1.id})

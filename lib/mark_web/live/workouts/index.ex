defmodule MarkWeb.Workouts.Index do
  use MarkWeb, :live_view
  alias Mark.Workouts

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_event("create-workout", _params, socket) do
    # Create a new workout
    case Workouts.create_workout(%{name: "New Workout"}) do
      {:ok, workout} ->
        # Update the socket with the new workout
        socket = assign(socket, :workout, workout)
        {:noreply, socket}

      {:error, changeset} ->
        # Handle error (e.g., show an error message)
        socket = assign(socket, :error, changeset)
        {:noreply, socket}
    end

    {:noreply, socket}
  end
end

# let use input the name of the workout and it can inform the ai prompt how to generate the workout

# then we can construct the workout round by round and create the round with its sets as we go

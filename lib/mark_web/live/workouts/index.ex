defmodule MarkWeb.Workouts.Index do
  use MarkWeb, :live_view
  alias Mark.Workouts

  @impl true
  def mount(_params, _session, socket) do
    form = Workouts.form_to_create_workout()
    socket = assign(socket, form: to_form(form))
    {:ok, socket}
  end

  @impl true
  def handle_event("validate", %{"form" => form_data}, socket) do
    dbg(form_data)

    socket =
      update(socket, :form, fn form ->
        AshPhoenix.Form.validate(form, form_data)
      end)

    {:noreply, socket}
  end

  @impl true
  def handle_event("save", %{"form" => form_data}, socket) do
    case AshPhoenix.Form.submit(socket.assigns.form, params: form_data) do
      {:ok, _workout} ->
        socket = socket |> put_flash(:info, "Workout created successfully.")

        {:noreply, socket}

      {:error, form} ->
        socket =
          socket
          |> put_flash(:error, "Could not create workout")
          |> assign(form: to_form(form))

        {:noreply, socket}
    end

    {:noreply, socket}
  end
end

# let use input the name of the workout and it can inform the ai prompt how to generate the workout

# then we can construct the workout round by round and create the round with its sets as we go

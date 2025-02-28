defmodule Mark.Workouts.Set do
  use Ash.Resource, otp_app: :mark, domain: Mark.Workouts, data_layer: AshPostgres.DataLayer

  postgres do
    table "sets"
    repo Mark.Repo
  end

  attributes do
    uuid_primary_key :id
    attribute :reps, :integer, allow_nil?: false
    attribute :weight, :integer, allow_nil?: false

    create_timestamp :inserted_at
  end

  relationships do
    belongs_to :round, Mark.Workouts.Round
  end
end

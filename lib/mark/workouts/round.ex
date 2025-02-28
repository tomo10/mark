defmodule Mark.Workouts.Round do
  use Ash.Resource, otp_app: :mark, domain: Mark.Workouts, data_layer: AshPostgres.DataLayer

  postgres do
    table "rounds"
    repo Mark.Repo
  end

  attributes do
    uuid_primary_key :id
    attribute :round_number, :integer, allow_nil?: false
    attribute :notes, :string
    attribute :rest_period, :integer

    timestamps()
  end

  relationships do
    belongs_to :workout, Mark.Workouts.Workout
    has_many :sets, Mark.Workouts.Set
  end
end

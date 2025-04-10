defmodule Mark.Workouts.Workout do
  use Ash.Resource, domain: Mark.Workouts, data_layer: AshPostgres.DataLayer

  postgres do
    table "workouts"
    repo Mark.Repo
  end

  actions do
    default_accept [:name, :description]

    create :create do
      accept [:name, :description]
    end

    read :read do
      primary? true
    end

    update :update do
      accept [:name, :description]
    end

    destroy :destroy
  end

  attributes do
    uuid_primary_key :id
    attribute :name, :string, allow_nil?: false
    attribute :description, :string, allow_nil?: true
    attribute :date, :utc_datetime, allow_nil?: false, default: &DateTime.utc_now/0
  end

  relationships do
    has_many :rounds, Mark.Workouts.Round
  end
end

defmodule Mark.Workouts.Workout do
  use Ash.Resource, domain: Mark.Workouts, data_layer: AshPostgres.DataLayer

  postgres do
    table "workouts"
    repo Mark.Repo
  end

  actions do
    default_accept [:name, :data]

    create :create do
      accept [:name, :data]
    end

    read :read do
      primary? true
    end

    update :update do
      accept [:data]
    end

    destroy :destroy
  end

  attributes do
    uuid_primary_key :id
    attribute :name, :string, allow_nil?: false
    attribute :data, :map, default: %{}
  end
end

defmodule Mark.Workouts.Workout do
  use Ash.Resource, domain: Mark.Workouts

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

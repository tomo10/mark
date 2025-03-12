defmodule Mark.Workouts.Exercise do
  use Ash.Resource, otp_app: :mark, domain: Mark.Workouts, data_layer: AshPostgres.DataLayer

  postgres do
    table "exercises"
    repo Mark.Repo
  end

  actions do
    create :create do
      accept [:name, :equipment]
    end

    read :read, primary?: true

    update :update do
      accept [:name, :equipment]
    end

    destroy :destroy
  end

  attributes do
    uuid_primary_key :id
    attribute :name, :string, allow_nil?: false
    attribute :equipment, :string

    create_timestamp :inserted_at
  end

  relationships do
    has_many :sets, Mark.Workouts.Set
  end
end

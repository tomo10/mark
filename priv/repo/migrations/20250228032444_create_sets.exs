defmodule Mark.Repo.Migrations.CreateSets do
  @moduledoc """
  Updates resources based on their most recent snapshots.

  This file was autogenerated with `mix ash_postgres.generate_migrations`
  """

  use Ecto.Migration

  def up do
    create table(:workouts, primary_key: false) do
      add :id, :uuid, null: false, default: fragment("gen_random_uuid()"), primary_key: true
      add :name, :text, null: false
      add :date, :utc_datetime, null: false, default: fragment("(now() AT TIME ZONE 'utc')")
    end

    create table(:sets, primary_key: false) do
      add :id, :uuid, null: false, default: fragment("gen_random_uuid()"), primary_key: true
      add :reps, :bigint, null: false
      add :weight, :bigint, null: false

      add :inserted_at, :utc_datetime_usec,
        null: false,
        default: fragment("(now() AT TIME ZONE 'utc')")

      add :round_id, :uuid
    end

    create table(:rounds, primary_key: false) do
      add :id, :uuid, null: false, default: fragment("gen_random_uuid()"), primary_key: true
    end

    alter table(:sets) do
      modify :round_id,
             references(:rounds,
               column: :id,
               name: "sets_round_id_fkey",
               type: :uuid,
               prefix: "public"
             )
    end

    alter table(:rounds) do
      add :round_number, :bigint, null: false
      add :notes, :text
      add :rest_period, :bigint

      add :inserted_at, :utc_datetime_usec,
        null: false,
        default: fragment("(now() AT TIME ZONE 'utc')")

      add :updated_at, :utc_datetime_usec,
        null: false,
        default: fragment("(now() AT TIME ZONE 'utc')")

      add :workout_id,
          references(:workouts,
            column: :id,
            name: "rounds_workout_id_fkey",
            type: :uuid,
            prefix: "public"
          )
    end
  end

  def down do
    drop constraint(:rounds, "rounds_workout_id_fkey")

    alter table(:rounds) do
      remove :workout_id
      remove :updated_at
      remove :inserted_at
      remove :rest_period
      remove :notes
      remove :round_number
    end

    drop constraint(:sets, "sets_round_id_fkey")

    alter table(:sets) do
      modify :round_id, :uuid
    end

    drop table(:rounds)

    drop table(:sets)

    drop table(:workouts)
  end
end

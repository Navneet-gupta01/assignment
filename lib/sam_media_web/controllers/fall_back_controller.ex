defmodule SamMediaWeb.FallbackController do
  use SamMediaWeb, :controller

  def call(conn, {:error, :validation_failure, errors}) do
    conn
    |> put_status(:unprocessable_entity)
    |> render(SamMediaWeb.ValidationView, "error.json", errors: errors)
  end

  def call(conn, {:error, :not_found}) do
    conn
    |> put_status(:not_found)
    |> render(SamMediaWeb.ErrorView, :"404")
  end

  def call(conn, {:error, _, errors}) do
    conn
    |> put_status(:unprocessable_entity)
    |> render(SamMediaWeb.ValidationView, "error.json", errors: errors)
  end

  def call(conn, {:error, errors}) do
    conn
    |> put_status(:unprocessable_entity)
    |> render(SamMediaWeb.ValidationView, "error.json", errors: errors)
  end
end

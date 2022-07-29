defmodule PraterWeb.RoomController do
  use PraterWeb, :controller

  alias Prater.Conversation
  alias Prater.Conversation.Room

  def index(conn, _params) do
    rooms = Prater.Conversation.list_rooms()
    render(conn, "index.html", rooms: rooms)
  end

  def new(conn, _params) do
    changeset = Conversation.change_room(%Room{})
    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"room" => room_params}) do
    case Conversation.create_room(room_params) do
      {:ok, room} ->
        conn
        |> put_flash(:info, "Room created successfully.")
        |> redirect(to: Routes.room_path(conn, :index))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end

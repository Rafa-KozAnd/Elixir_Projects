defmodule AuthSystem do
  @users %{
    "usuario1" => %{password: "senha123", name: "Usuário 1"},
    "usuario2" => %{password: "abc456", name: "Usuário 2"}
  }

  def register(username, password, name) do
    case Map.get(@users, username) do
      nil ->
        new_user = %{password: password, name: name}
        updated_users = Map.put(@users, username, new_user)
        {:ok, updated_users}
      _ ->
        {:error, "Usuário já existe."}
    end
  end

  def login(username, password) do
    case Map.get(@users, username) do
      %{password: stored_password} when stored_password == password ->
        {:ok, %{username: username, name: Map.get(@users, username).name}}
      _ ->
        {:error, "Credenciais inválidas."}
    end
  end

  def authenticated?(username) do
    Map.has_key?(@users, username)
  end
end

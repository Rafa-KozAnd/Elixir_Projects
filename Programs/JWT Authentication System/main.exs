defmodule MyAppWeb.Auth do
  alias MyApp.Accounts

  def login(username, password) do
    case Accounts.get_user_by_username(username) do
      %Accounts.User{password_hash: hash} ->
        if Bcrypt.checkpw(password, hash) do
          {:ok, user} = Accounts.get_user_by_username(username)
          {:ok, %{"token" => token}} = MyAppWeb.Guardian.encode_and_sign(user)
          {:ok, %{user: user, token: token}}
        else
          {:error, "Credenciais inválidas."}
        end
      nil ->
        {:error, "Usuário não encontrado."}
    end
  end
end

defmodule MyAppWeb.Guardian do
  use Guardian, otp_app: :my_app

  def subject_for_token(user, _claims) do
    {:ok, to_string(user.id)}
  end

  def resource_from_claims(claims) do
    user_id = claims["sub"]
    {:ok, MyApp.Accounts.get_user(user_id)}
  end
end

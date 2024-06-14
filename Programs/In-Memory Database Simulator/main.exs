defmodule InMemoryDatabase do
  defmodule State do
    @table %{}

    def get(table, key) do
      Map.get(table, key)
    end

    def put(table, key, value) do
      Map.put(table, key, value)
    end

    def delete(table, key) do
      Map.delete(table, key)
    end

    def all(table) do
      table
    end
  end
end

# Exemplo de uso:
database = InMemoryDatabase.State

# Inserir dados
database = InMemoryDatabase.State.put(database, :users, %{
  1 => %{name: "Alice", age: 30},
  2 => %{name: "Bob", age: 28}
})

# Obter um registro
IO.inspect InMemoryDatabase.State.get(database, :users)[1]

# Atualizar um registro
database = InMemoryDatabase.State.put(database, :users, %{2 => %{name: "Bob", age: 29}})

# Excluir um registro
database = InMemoryDatabase.State.delete(database, :users)

# Obter todos os registros
IO.inspect InMemoryDatabase.State.all(database)

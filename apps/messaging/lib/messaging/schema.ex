defmodule MessagingWeb.Schema do
  use Absinthe.Schema

  object :link do
    field :id, non_null(:id)
    field :url, non_null(:string)
  end

  query do
    field :all_links, non_null(list_of(non_null(:link))) do
      resolve &Messaging.LinkResolver.all_links/3
    end
  end
end
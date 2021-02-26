defmodule MessagingWeb.Schema do
  use Absinthe.Schema

  object :channel do
    field :id, non_null(:id)
    field :name, non_null(:string)
    field :messages, list_of(:message) do
      {
        resolve &Messaging.MessageResolver.recent/3
      } end
  end

  object :message do
    field :channel, :channel
    field :content, non_null(:string)
  end

  mutation do
    field :create_channel, type: :channel do
      arg :name, non_null(:string)
      resolve &Messaging.ChannelResolver.create/3
    end
  end

  query do
    field :channel, non_null(:channel) do
      arg :id, non_null(:id)
      resolve &Messaging.ChannelResolver.find/3
    end
  end
end
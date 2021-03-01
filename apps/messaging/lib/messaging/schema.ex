defmodule MessagingWeb.Schema do
  use Absinthe.Schema

  object :user do
    field :id, non_null(:id)
  end

  object :message do
    field :id, non_null(:id)
    field :channel, :channel
    field :sender, :user do
      resolve &Messaging.UserResolver.find/3
    end
    field :content, non_null(:string)
  end

  object :channel do
    field :id, non_null(:id)
    field :members, list_of(:id)
    field :messages, list_of(:message) do
      resolve &Messaging.MessageResolver.recent/3
    end
  end

  mutation do
    field :create_user, type: :user do
      resolve &Messaging.UserResolver.create/3
    end

    field :create_channel, type: :channel do
      resolve &Messaging.ChannelResolver.create/3
    end

    field :post_message, type: :message do
      arg :channel_id, non_null(:id)
      arg :sender_id, non_null(:id)
      arg :content, non_null(:string)
      resolve &Messaging.MessageResolver.post/3
    end
  end

  query do
    field :user, non_null(:user) do
      arg :id, non_null(:id)
      resolve &Messaging.UserResolver.find/3
    end

    field :channel, non_null(:channel) do
      arg :id, non_null(:id)
      resolve &Messaging.ChannelResolver.find/3
    end

    field :message, non_null(:message) do
      arg :channel_id, non_null(:id)
      arg :message_id, non_null(:id)
      resolve &Messaging.MessageResolver.find/3
    end
  end
end
module GraphqlHelper
  def gql(query:)
    post '/graphql', params: { query: }
    HashWithIndifferentAccess.new(JSON.parse(response.body))
  end

  def execute(query:, current_user: nil)
    result = TasktrackerSchema.execute(query, context: { current_user: })
    HashWithIndifferentAccess.new(result)
  end
end

module GraphqlHelper
  def gql(query:, token: nil)
    post '/graphql', params: { query: }, headers: { Authorization: token }
    HashWithIndifferentAccess.new(JSON.parse(response.body))
  end
end

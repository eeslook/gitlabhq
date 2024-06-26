# frozen_string_literal: true

module Types
  module Projects
    module Services
      # rubocop:disable Graphql/AuthorizeTypes
      # TODO: Remove in 17.0, see https://gitlab.com/gitlab-org/gitlab/-/merge_requests/108418
      class JiraProjectType < BaseObject
        graphql_name 'JiraProject'

        field :key, GraphQL::Types::String, null: false,
          description: 'Key of the Jira project.'
        field :name, GraphQL::Types::String, null: true,
          description: 'Name of the Jira project.'
        field :project_id, GraphQL::Types::Int, null: false,
          description: 'ID of the Jira project.',
          method: :id
      end
      # rubocop:enable Graphql/AuthorizeTypes
    end
  end
end

# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Namespace::Detail, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to :namespace }
    it { is_expected.to belong_to(:creator).class_name('User') }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:namespace) }
  end

  context 'when namespace description changes' do
    let(:namespace) { create(:namespace, description: "old") }

    it 'changes namespace details description' do
      expect { namespace.update!(description: "new") }
        .to change { namespace.namespace_details.description }.from("old").to("new")
    end
  end

  context 'when project description changes' do
    let(:project) { create(:project, description: "old") }

    it 'changes project namespace details description' do
      expect { project.update!(description: "new") }
        .to change { project.project_namespace.namespace_details.description }.from("old").to("new")
    end
  end

  context 'when group description changes' do
    let(:group) { create(:group, description: "old") }

    it 'changes group namespace details description' do
      expect { group.update!(description: "new") }
        .to change { group.namespace_details.description }.from("old").to("new")
    end
  end

  context 'with loose foreign key on namespace_details.creator_id' do
    it_behaves_like 'cleanup by a loose foreign key' do
      let_it_be(:parent) { create(:user) }
      let_it_be(:model) do
        namespace = create(:namespace)
        namespace.namespace_details.creator = parent
        namespace.namespace_details.save!
        namespace.namespace_details
      end
    end
  end
end

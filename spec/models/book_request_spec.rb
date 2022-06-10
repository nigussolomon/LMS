require 'rails_helper'

RSpec.describe BookRequest, type: :model do
  subject { create(:book_request) } 

  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:category) }
  it { should validate_presence_of(:status) }

  it { should validate_inclusion_of(:status).in_array(%w[ACCEPTED DENIED PENDING]) }
end

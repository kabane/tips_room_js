require 'rails_helper'

RSpec.describe Tip, type: :model do
  context 'scope' do
    describe 'published_only' do
      let!(:user) { create(:user, :admin) }

      context 'published' do
        let!(:tips) { create(:tip, :published) }

        it '取得できるtipsの数が正しいこと' do
          expect(Tip.all.count).to eq(1)
          expect(Tip.published_only.count).to eq(1)
        end
      end

      context 'draft' do
        let!(:tips) { create(:tip, :draft) }

        it '取得できるtipsの数が正しいこと' do
          expect(Tip.all.count).to eq(1)
          expect(Tip.published_only.count).to eq(0)
        end
      end

    end
  end

end

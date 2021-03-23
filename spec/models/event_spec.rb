require 'rails_helper'

RSpec.describe Event, type: :model do
  before do
    @event = FactoryBot.build(:event)
  end

  describe '予定を登録' do
    context '予定を登録できる時' do
      it 'title、start_time、end_timeがあれば登録出来る' do
        expect(@event).to be_valid
      end
    end

    context '予定が登録できない時' do
      it 'titleが空の場合、登録できない' do
        @event.title = ''
        @event.valid?
        expect(@event.errors.full_messages).to include('Titleを入力してください')
      end

      it 'start_timeが空の場合、登録できない' do
        @event.start_time = ''
        @event.valid?
        expect(@event.errors.full_messages).to include('開始時間を入力してください')
      end

      it 'end_timeが空の場合、登録できない' do
        @event.end_time = ''
        @event.valid?
        expect(@event.errors.full_messages).to include('終了時間を入力してください')
      end
    end
  end
end

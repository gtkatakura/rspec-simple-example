require 'rails_helper'

describe Period do
  # end_at menor que start_at
  # start_at/end_at eh uma data invalida

  it do
    expect([1, 2, 3]).to contain_exactly(1, 3, 2)
  end

  context '#start_at' do
    context 'when initialize with value' do
      it '#start_at has set value with success' do
        period = Period.new(start_at: DateTime.parse('15/10/1995'))

        expect(period.start_at).to eq(DateTime.parse('15/10/1995'))
      end
    end
  end

  context '#end_at' do
    context 'when initialize with value' do
      context 'and that value is nil' do
        it '#end_at has set value with success' do
          period = Period.new(start_at: DateTime.parse('15/01/1995'), end_at: nil)

          expect(period.end_at).to eq(nil)
        end
      end

      context 'and that value is a DateTime' do
        it '#end_at has set value with success' do
          period = Period.new(start_at: DateTime.parse('15/01/1995'), end_at: DateTime.parse('15/10/1995'))

          expect(period.end_at).to eq(DateTime.parse('15/10/1995'))
        end
      end
    end
  end

  context '#opened?' do
    context 'when has start_at and end_at' do
      it 'returns false' do
        period = Period.new(start_at: DateTime.parse('15/01/1995'), end_at: DateTime.parse('15/10/1995'))

        expect(period.opened?).to eq(false)
      end
    end


    context 'when has start_at and not has end_at' do
      it 'returns true' do
        period = Period.new(start_at: DateTime.parse('15/01/1995'))

        expect(period.opened?).to eq(true)
      end
    end
  end

  context '#days' do
    context 'when has start_at and end_at' do
      context 'and values is from same month' do
        it 'returns a number' do
          period = Period.new(start_at: DateTime.parse('15/10/1995'), end_at: DateTime.parse('20/10/1995'))

          expect(period.days).to eq(6)
        end
      end

      context 'and values is from different months' do
        it 'returns a number' do
          period = Period.new(start_at: DateTime.parse('15/10/1995'), end_at: DateTime.parse('15/11/1995'))

          expect(period.days).to eq(32)
        end
      end

      context 'and values is from different years' do
        it 'returns a number' do
          period = Period.new(start_at: DateTime.parse('15/10/1995'), end_at: DateTime.parse('15/10/1996'))

          expect(period.days).to eq(367)
        end
      end
    end

    context 'when has start_at and not has end_at' do
      it 'returns nil' do
        period = Period.new(start_at: DateTime.parse('15/01/1995'))

        expect(period.days).to eq(nil)
      end
    end
  end
end

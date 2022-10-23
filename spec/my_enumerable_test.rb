require_relative '../my_enumerable'
require_relative 'spec_helper'

RSpec.describe MyEnumerable do
  let(:arr) { [1, 2, 3, 4] }

  describe '#my_all?' do
    context 'when no block and no arguments given' do
      it { expect(arr.my_all?).to eq(true) }
      it { expect([].my_all?).to eq(true) }
    end

    context 'when block is given and no arguments' do
      it { expect(arr.my_all? { |x| x > 0 }).to eq(true) }
      it { expect([].my_all? { |x| x > 0 }).to eq(true) }
    end

    context 'when argument is given and no block' do
      it { expect(arr.my_all?(Numeric)).to eq(true) }
      it { expect([].my_all?(Numeric)).to eq(true) }
    end

    context 'when block and argument given' do
      it { expect(arr.my_all?(Numeric) { |x| x < 0 }).to eq(true) }
      it { expect(arr.my_all?(Numeric) { |x| x < 0 }).to eq(true) }
    end
  end

  describe '#my_any?' do
    context 'when no block and no arguments given' do
      it { expect(arr.my_any?).to eq(true) }
    end

    context 'when block is given and no arguments' do
      it { expect(arr.my_any? { |x| x > 0 }).to eq(true) }
    end

    context 'when argument is given and no block' do
      it { expect(arr.my_any?(Numeric)).to eq(true) }
    end

    context 'when block and argument given' do
      it { expect(arr.my_any?(Numeric) { |x| x < 0 }).to eq(true) }
    end
  end

  describe '#my_none?' do
    context 'when no block and no arguments given' do
      it { expect([nil, nil].my_none?).to eq(true) }
      it { expect([].my_none?).to eq(true) }
    end

    context 'when block is given and no arguments' do
      it { expect(arr.my_none? { |x| x < 0 }).to eq(true) }
      it { expect([].my_none? { |x| x < 0 }).to eq(true) }
    end

    context 'when argument is given and no block' do
      it { expect(arr.my_none?(String)).to eq(true) }
      it { expect([].my_none?(Numeric)).to eq(true) }
    end

    context 'when block and argument given' do
      it { expect(arr.my_none?(String) { |x| x < 0 }).to eq(true) }
      it { expect([].my_none?(Numeric) { |x| x < 0 }).to eq(true) }
    end
  end

  describe '#my_each' do
    context 'when no block given' do
      it { expect(arr.my_each) == (arr.to_enum(:my_each)) }
    end

    context 'when block is given' do
      it { expect(arr.my_each { |x| print x, 'n, ' }) == ('1n, 2n, 3n, 4n, '[1, 2]) }
    end
  end

  describe '#my_include?' do
    context 'when argument is given' do
      it { expect(arr.my_include?(3)).to eq(true) }
    end
  end

  describe '#my_map!' do
    context 'when no block given' do
      it { expect(arr.my_map!) == arr.to_enum(:my_map!) }
    end
    context 'when block is given' do
      it { expect(arr.my_map! { |x| x += 1 }).to eq([2, 3, 4, 5]) }
      it { expect { arr.my_map! { |x| x += 1 } }.to change { arr }.to([2, 3, 4, 5]) }
    end
  end

  describe '#my_size' do
    context 'generic call' do
      it { expect(arr.my_size).to eq(4) }
    end
  end

  describe '#my_count' do
    context 'when no block and no arguments given' do
      it { expect(arr.my_count).to eq(4) }
    end

    context 'when block is given and no arguments' do
      it { expect(arr.my_count { |x| x > 2 }).to eq(2) }
    end

    context 'when argument is given and no block' do
      it { expect(arr.my_count(2)).to eq(1) }
    end

    context 'when block and argument given' do
      it { expect(arr.my_count(2) { |x| x > 0 }).to eq(1) }
    end
  end

  describe '#my_length' do
    context 'generic call' do
      it { expect(arr.my_length).to eq(4) }
    end
  end

  describe '#my_select' do
    context 'when no block given' do
      it { expect(arr.my_select) == arr.to_enum(:my_select) }
    end
    context 'when block is given' do
      it {
        expect(arr.my_select { |x| x > 1 }).to eq([2, 3, 4])
      }
    end
  end

  describe '#my_find' do
    context 'when no block given' do
      it { expect(arr.my_find) == arr.to_enum(:my_find) }
    end
    context 'when block is given and no argument' do
      it { expect(arr.my_find { |x| x > 1 }).to eq(2) }
    end
    context 'when block and argument is given' do
      it { expect(arr.my_find(proc { 'No matches found' }) { |x| x < 0 }) == 'No matches found' }
    end
  end

  describe '#my_find_all' do
    context 'when no block given' do
      it { expect(arr.my_find_all) == arr.to_enum(:my_find_all) }
    end
    context 'when block is given' do
      it { expect(arr.my_find_all { |x| x > 1 }).to eq([2, 3, 4]) }
    end
  end

  describe '#my_find_index' do
    context 'when no block and no argument given' do
      it { expect(arr.my_find_index) == arr.to_enum(:my_find_index) }
    end
    context 'when block is given and no argument' do
      it { expect(arr.my_find_index { |x| x > 1 }).to eq(1) }
    end
    context 'when argument is given and no block' do
      it { expect(arr.my_find_index(3)).to eq(2) }
    end
    context 'when argument and block given' do
      it { expect(arr.my_find_index(3) { |x| x > 1 }).to eq(2) }
    end
  end

  describe '#my_reject' do
    context 'when no block given' do
      it { expect(arr.my_reject) == arr.to_enum(:my_reject) }
    end
    context 'when block is given' do
      it { expect(arr.my_reject { |x| x > 2 }).to eq([1, 2]) }
    end
  end

  describe '#my_min' do
    context 'when no block and no argument given' do
      it { expect(arr.my_min).to eq(1) }
    end
    context 'when block and no argument given' do
      it { expect(arr.my_min { |a, b| -a <=> -b }).to eq(4) }
    end
    context 'when argument and no block given' do
      it { expect(arr.my_min(3)).to eq([1, 2, 3]) }
    end
    context 'when argument and block are given' do
      it { expect(arr.my_min(3) { |a, b| -a <=> -b }).to eq([4, 3, 2]) }
    end
  end

  describe '#my_max' do
    context 'when no block and no argument given' do
      it { expect(arr.my_max).to eq(4) }
    end
    context 'when block and no argument given' do
      it { expect(arr.my_max { |a, b| -a <=> -b }).to eq(1) }
    end
    context 'when argument and no block given' do
      it { expect(arr.my_max(3)).to eq([4, 3, 2]) }
    end
    context 'when argument and block are given' do
      it { expect(arr.my_max(3) { |a, b| -a <=> -b }).to eq([1, 2, 3]) }
    end
  end
end

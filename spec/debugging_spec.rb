RSpec.describe 'Debugging Example' do
  it 'has a bug to fix (will fail)' do
    expect(2 * 2).to eq(5) # This will fail
  end

  it 'raises a NoMethodError' do
    arr = [1, 2, 3]
    expect { arr.not_a_method }.to raise_error(NoMethodError)
  end

  it 'raises an ArgumentError' do
    def add(a, b); a + b; end
    expect { add(1) }.to raise_error(ArgumentError)
  end

  it 'raises a TypeError' do
    expect { "hi" + 2 }.to raise_error(TypeError)
  end

  it 'fails with wrong matcher' do
    expect { expect(42).to be_empty }.to raise_error(RSpec::Expectations::ExpectationNotMetError)
  end

  it 'fails with wrong value in include matcher' do
    expect([:a, :b, :c]).not_to include(:d)
  end

  it 'is a pending spec for students to fix' do
    expect(10 / 2).not_to eq(3)
  end

  it 'is a skipped spec (students can unskip and debug)' do
    expect("hello".reverse).not_to eq("olleh!")
  end
end

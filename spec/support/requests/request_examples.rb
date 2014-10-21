shared_examples 'w/o Authorization header' do
  it 'returns 401 unauthorized' do
    is_expected.to eq 401
  end
end

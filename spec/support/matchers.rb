ERROR_PATH = 'error'
MESSAGE_PATH = 'message'
ERROR_MESSAGE_PATH = "#{ERROR_PATH}/#{MESSAGE_PATH}"

RSpec::Matchers.define :have_errors do |expected|
  match do |actual|
    expect(actual).to have_json_path(ERROR_PATH)
  end

  failure_message do
    %(expected to have error\n) +
    %(got no errors)
  end 

  failure_message_when_negated do
    %(expected to not have errors\n) +
    %(got errors)
  end
end

RSpec::Matchers.define :have_error_message do |expected|
  match do |actual|
    expect(actual).to have_errors
    expect(actual).to have_json_path(ERROR_MESSAGE_PATH)
    expect(actual).to be_json_eql(%("#{expected}")).at_path(ERROR_MESSAGE_PATH)
  end

  failure_message do
    %(expected "#{expected}"\n) +
    %(got "#{JSON.parse(actual)[ERROR_PATH][MESSAGE_PATH]}")
  end 

  failure_message_when_negated do
    %(expected not "#{expected}"\n) +
    %(got "#{JSON.parse(actual)[ERROR_PATH][MESSAGE_PATH]}")
  end
end


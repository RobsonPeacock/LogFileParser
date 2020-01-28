require_relative '../lib/log_parser'

RSpec.describe LogParser do
  context 'parsing the file' do
    it 'should accept log file or raise error if does not exist' do
      expect(LogParser.new.file_exist('./log/webserver.log')).to be_truthy
    end

    it 'should return file content as hash' do
      expect(LogParser.new.parse_file('./log/webserver.log')).to be_an_instance_of(Array)
    end

    it 'should accept return a hash' do
      expect(LogParser.new.unique_page_visits('./log/webserver.log')).to be_an_instance_of(Hash)
    end

    it 'should accept return a hash' do
      expect(LogParser.new.page_visits('./log/webserver.log')).to be_an_instance_of(Hash)
    end
  end
end

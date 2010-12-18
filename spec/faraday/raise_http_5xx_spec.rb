require File.expand_path('../../spec_helper', __FILE__)

describe Faraday::Reponse::RaiseHttp5xx do
  before do
    @client = Twitter::Client.new
  end
end
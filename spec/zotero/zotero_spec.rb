describe 'Zotero' do
  it 'should create an oauth consumer' do
    Zotero.consumer(zotero_settings[:consumer_token], zotero_settings[:consumer_secret]).should be_an_instance_of OAuth::Consumer
  end

  it 'should fail to register a client with no API key, and no OAuth' do
    lambda { z = Zotero.register({:site => zotero_site})}.should raise_error RuntimeError
  end

  it 'should register a client with a bad API key, and no OAuth, and fail to access public resources' do
    z = Zotero.register({:consumer_key => zotero_settings[:bad_consumer_token], :site => zotero_site})
    lambda{ z.Library.find(:all,:params => {:order => 'date', :limit => 1})}.should raise_error ActiveResource::UnauthorizedAccess
    z.destroy
  end


  it 'should register a client with a good API key, but no OAuth, and fail to access private resources' do
    z = Zotero.register({:consumer_key=> zotero_settings[:consumer_token], :site => zotero_site})
    lambda{ z.User.find(:one, :from => "/me")}.should raise_error ActiveResource::UnauthorizedAccess
    z.destroy
  end

  it 'should register a client with a valid oauth token, and be able to access public and private resources' do
    z = Zotero.register({:access_token=> valid_oauth_access_token, :site => zotero_site})
    lambda{ z.Library.find(:all,:params => {:order => 'date', :limit => 1})}.should_not raise_error ActiveResource::UnauthorizedAccess
    lambda{ z.User.find(:one, :from => "/me")}.should_not raise_error ActiveResource::UnauthorizedAccess
    z.destroy
  end

  it 'should register a client with a good API key, but no OAuth, and be able to access public resources' do
    z = Zotero.register({:consumer_key => zotero_settings[:consumer_token], :site => zotero_site})
    lambda{ z.Track.find(:all,:params => {:order => 'hotness', :limit => 1})}.should_not raise_error ActiveResource::UnauthorizedAccess
    z.destroy
  end


end

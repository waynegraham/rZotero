module Zotero
  # Custom error class for rescuing from Zotero errors
  class Error < StandardError; end
  
  # Raised when Zotero returns the HTTP status code 400
  class BadRequest < StandardError; end
  
  # raise when Zotero returns the HTTP status code 401
  class Unauthorized < StandardError; end
  
  # raise when Zotero returns the HTTP status code 403
  class Forbidden < StandardError; end
  
  # raise when Zotero returns the HTTP status code 404
  class NotFound < StandardError; end

end
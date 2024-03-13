class ApplicationController < ActionController::API
	# before_action :validate_jwt, only: %I[reserve]

	respond_to :json
end

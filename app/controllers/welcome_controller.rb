class WelcomeController < ApplicationController
	http_basic_authenticate_with name: "kefiriaus", password: "Nhfvgfvgfv123!"
	
	def index
	end
end

class SessionsController < Devise::SessionsController
  layout -> (controller) { controller.request.xhr? ? false : 'application' }
end

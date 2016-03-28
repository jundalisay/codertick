Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '769055986559206', 'd65418f788ffa510d41765f928ac05d2'
end
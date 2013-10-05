unless Rails.env.development?
  Threestars::Application.config.middleware.use ExceptionNotification::Rack,
    email: {
      email_prefix:         "[#{Rails.env}][#{Settings.site_name}] ",
      sender_address:       %{"ThreestarsNotifier" <#{Settings.mailer_sender}>},
      exception_recipients: %w{rails.dev0115@gmail.com},
      delivery_method:      :smtp,
    }
end


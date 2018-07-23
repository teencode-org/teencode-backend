module Support
  module TestHelpers
    def json(body)
      JSON.parse(body, symbolize_names: true)
    end

    def expect_errors(expected, details)
      expect(expected).to eql(details.map { |h| h[:error] })
    end

    def enqueued_emails(mailer, template_name)
      ActiveJob::Base
        .queue_adapter
        .enqueued_jobs
        .select { |j| j[:job] == ActionMailer::DeliveryJob }
        .map { |j| j[:args] }
        .select { |args| args[0] == mailer.name && args[1] == template_name.to_s }
    end
  end
end
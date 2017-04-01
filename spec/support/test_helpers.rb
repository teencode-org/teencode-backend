module Support
  module TestHelpers
    def json(response_body)
      JSON.parse(body, symbolize_names: true)
    end

    # def get_helper(user, url, body = nil, expected_status = 200)
    #   request_helper(method: :get, url: url, body: body, headers: stark_headers_for(user), expected_status: expected_status)
    # end
    #
    # def request_helper(method: ,url: , expected_status: , body: nil, headers: {})
    #   send(method, url, body, headers)
    #
    #   expect(response.status).to eq(expected_status)
    #
    #   if response.body.blank?
    #     response.body
    #   else
    #     expect(response.content_type).to eq('application/json')
    #   end
    # end
  end
end

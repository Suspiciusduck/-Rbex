class AddsController < ApplicationController
  def show
    @add = Add.find(params[:id])
    @image_url = fetch_random_image
  end

  private

  def fetch_random_image
    response = HTTParty.get('https://api.unsplash.com/photos/random', {
    query: { client_id: 'KhA47ad3rLzB5NsxHPpkJjmpI5PSk4UCmMY4w9N_YRE' }
    })

    if response.success?
      data = JSON.parse(response.body)
      data['urls']['regular']
    else
      'https://example.com/default-image.jpg'
    end
  end
end
class AddsController < ApplicationController
  def index
  end
end

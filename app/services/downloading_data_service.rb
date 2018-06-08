# Service connect with explicited URL and retrive data from it
class DownloadingDataService
  def harvest_source
    URI.parse('https://jsonplaceholder.typicode.com/todos')
  end

  def harvest
    valid_harvest_source?(harvest_source)
    raw_data = parse_data(gather_data(harvest_source))
    ProcessingDataService.new(raw_data).execute
  end

  private

  def valid_harvest_source?(url)
    return false unless Net::HTTP.get_response(url).code == '200'
  end

  def gather_data(url)
    Net::HTTP.get(url)
  end

  def parse_data(data)
    JSON.parse(data, symbolize_names: true)
  end
end

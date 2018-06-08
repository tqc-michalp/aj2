namespace :jobs do
  desc "parse and save to the database data (todo list) from external datapoint - https://jsonplaceholder.typ"
  task work: :environment do
    DownloadingDataService.new().harvest
  end
end

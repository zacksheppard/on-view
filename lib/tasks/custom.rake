desc "Fetch new item"
task :fetch_item => :environment do
  require 'nokogiri'  
  require 'open-uri' 

  # Item selection is random via a rand function in 'start_index'
  random_photo = "http://www.brooklynmuseum.org/opencollection/api/?method=collection.search&version=1&api_key=#{ENV["BK_MUSEUM_KEY"]}&item_type=object&rights_type=creative_commons_by_nc,no_known_copyright_restrictions,copyright_artist_or_artists_estate,status_unclear_research_required,orphaned_work&collection_id=3&max_image_size=768&start_index=#{rand(1..1000)}&results_limit=1"
  doc = Nokogiri::HTML(open(random_photo))
  object_id =  doc.css('object')[0]['id']

  item_url = "http://www.brooklynmuseum.org/opencollection/api/?method=collection.getItem&version=1&api_key=#{ENV["BK_MUSEUM_KEY"]}&item_type=object&item_id=#{object_id}&max_image_size=768&format=xml"
  doc = Nokogiri::HTML(open(item_url))

  i = Item.new
  i.artist_name = doc.css('artist')[0]['name']
  i.title = doc.css('object')[0]['title']
  i.label = doc.css('object')[0]['label']
  i.url = doc.css('object')[0]['uri']
  i.image_url = doc.css('image')[0]['uri']
  i.object_date = doc.css('object')[0]['object_date']
  i.medium = doc.css('object')[0]['medium']
  i.dimensions = doc.css('object')[0]['dimensions']
  i.credit_line = doc.css('object')[0]['credit_line']
  i.accession_number = doc.css('object')[0]['accession_number']

  i.save
  puts "The new item is #{i.title} - #{i.url}."

end

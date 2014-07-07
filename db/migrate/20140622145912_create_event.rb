class CreateEvent < ActiveRecord::Migration
  def change
    create_table :events do |t|  
      t.integer :broadcast_event_id    
      t.string :episode_title
      t.string :slug
      t.string :hashtag
      t.datetime :start_time
      t.datetime :end_time     
      t.text :description
      t.integer :brand_id

      t.timestamps
    end
  end
end


46363

curl -s -L "https://api.zeebox.com/epg/1/broadcastevent/1239235"  \
-H "zeebox-app-id:8e40ef06" \
-H "zeebox-app-key:9a7caddc6a9e5434fb02ab06f7277be4" \
| gzip -dc \
| python -mjson.tool

curl -s -L "https://api.zeebox.com/epg/1/broadcastevent/1239235"  \
-H "zeebox-app-id:8e40ef06" \
-H "zeebox-app-key:9a7caddc6a9e5434fb02ab06f7277be4" \
| gzip -dc \
| python -mjson.tool

curl -s -L "https://api.zeebox.com/epg/1/episode/1245537"  \
-H "zeebox-app-id:8e40ef06" \
-H "zeebox-app-key:9a7caddc6a9e5434fb02ab06f7277be4" \
| gzip -dc \
| python -mjson.tool
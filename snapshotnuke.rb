#!/usr/bin/env ruby

snapshot_list_raw = `tmutil listlocalsnapshots /`

puts snapshot_list_raw
puts "\nAll of the above snapshots will be deleted. Press enter to continue (may ask for your sudo password)."
gets

snapshot_list = snapshot_list_raw.split("\n")

snapshot_ids = []

snapshot_list.each do | snapshot_name |
  snapshot_id = snapshot_name.split('.')[3]
  next if (snapshot_id.nil?)
  snapshot_ids.append(snapshot_id)
end

snapshot_ids.each do | snapshot_id |
  puts "Deleting local snapshot '#{snapshot_id}'..."
  system("sudo tmutil deletelocalsnapshots #{snapshot_id}")
end

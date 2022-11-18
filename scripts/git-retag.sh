#!/bin/sh



#def git_logs
#  `git log --oneline`
#end
#
#def sha_for_tag(tag)
#  `git log --format=format:%H --grep "#{tag}"`
#end
#
TAG_MATCH="<(.*?)>" # <topic-a-start> OR <topic-a-end, topic-b-start>

log_lines=$(git log --oneline)

echo $log_lines

while IFS= read -r line; do
    if [[ $line =~ $TAG_MATCH ]]; then
#      echo $line
      echo "${BASH_REMATCH[1]}"
    fi
done <<< "$log_lines"



#def extract_tags_from_messages
#  tags = []
#  git_logs.each_line do |log_line|
#    tags_in_comments = log_line.match(TAG_MATCH) { |match| match.captures.first }
#    if (tags_in_comments) # Some commits have no tags
#      # ... but some commits have multiple tags!
#      tags << tags_in_comments.split(',').map { |tag| tag.strip }
#    end
#  end
#  tags.flatten # make it all one big array.
#end
#
#### do the work ###
#
#tags_to_shas = extract_tags_from_messages.to_h do |tag|
#  [tag, sha_for_tag(tag)]
#end
#
#puts "\n\n===== Replace Tags: copy-paste to run ===== "
#
#tags_to_shas.each do |tag, sha|
#  puts "git tag --force #{tag} #{sha}"
#end
#
#puts "
#Next:
#git push --tags --force
#"
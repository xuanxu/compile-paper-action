require 'find'
require 'open3'
require 'uri'
require 'fileutils'

def clone_repo(url, local_path)
    url = URI.extract(url.to_s).first
    return false if url.nil?

    FileUtils.rm_rf(local_path) if Dir.exist?(local_path)
    FileUtils.mkdir_p(local_path)
    stdout, stderr, status = Open3.capture3 "git clone #{url} #{local_path}"
    status.success?
  end

def change_branch(branch, local_path)
  return true if (branch.nil? || branch.strip.empty?)
  stdout, stderr, status = Open3.capture3 "git -C #{local_path} checkout #{branch}"
  status.success?
end

def find(search_path)
  paper_path = nil

  if Dir.exist? search_path
    Find.find(search_path).each do |path|
      if path =~ /paper\.tex$|paper\.md$/
        paper_path = path
        break
      end
    end
  end

  paper_path
end

repo_url = ENV["REPO_URL"]
repo_branch = ENV["PAPER_BRANCH"]

repo_local_path = "./target_repository"

if repo_url.nil? || repo_url.empty?
  raise "   !! ERROR: Missing target repository's URL"
end

raise "   !! ERROR: Invalid repository URL: #{repo_url}" unless clone_repo repo_url, repo_local_path
raise "   !! ERROR: Invalid branch: #{repo_branch}" unless change_branch repo_branch, repo_local_path

paper_path = find repo_local_path

if paper_path.nil?
  raise "   !! ERROR: Paper file not found"
else
  puts paper_path
end

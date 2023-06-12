# frozen_string_literal: true

describe Octokit::Client::CodeScanning, :vcr do
  before(:each) do
    @client = oauth_client

    puts "test_repo: #{@test_repo}"
    puts "client: #{@client}"

    client_commits = @client.commits(@test_repo)
    puts "@client_commits: #{client_commits}"
    @commit_sha = client_commits.first.sha
    puts "@commit_sha: #{@commit_sha}"
    @ref = "refs/heads/main"
    puts "@@ref: #{@ref}"
  end
  
  describe '.upload_sarif_data' do
    it 'upload SARIF data' do
      @client.upload_sarif_data(
        @test_repo,
        @commit_sha,
        @ref
      )

      assert_requested :post, repo_url('code-scanning/sarifs')
    end

    it 'returns the SARIF upload information' do
      sarif_upload = @client.upload_sarif_data(
        @test_repo,
        @commit_sha,
        @ref
      )

      expect(sarif_upload.id).to eq("todo")
      expect(sarif_upload.url).to eq("todo")
    end
  end

  private

  def repo_url(repo_path)
    github_url(['repos', @test_repo, repo_path].join('/'))
  end
end

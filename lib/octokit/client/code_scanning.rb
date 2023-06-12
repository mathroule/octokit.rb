# frozen_string_literal: true

module Octokit
  class Client
    # Methods for the code scanning alerts API
    #
    # @see https://docs.github.com/rest/code-scanning
    module CodeScanning

      # Uploads SARIF data containing the results of a code scanning analysis
      #
      # @param repo [Integer, String, Repository, Hash] A GitHub repository
      # @param sha [String] The SHA of the commit to which the analysis you are uploading relates
      # @param ref [String] The full Git reference, formatted as `refs/heads/<branch name>`, `refs/pull/<number>/merge`, or `refs/pull/<number>/head`
      #
      # @return [Sawyer::Resource] SARIF upload information
      # @see https://docs.github.com/rest/code-scanning#upload-an-analysis-as-sarif-data
      def upload_sarif_data(repo, sha, ref, options = {})
        options[:sha] = sha
        options[:ref] = ref

        post "#{Repository.path repo}/code-scanning/sarifs", options
      end
    end
  end
end

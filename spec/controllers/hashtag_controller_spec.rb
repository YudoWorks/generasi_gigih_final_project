require_relative '../test_helper'
require_relative '../../controllers/hashtag_controller'

describe HashtagController do
    describe ".trending" do
        it "return top_5_hashtags_24_hours" do
            top_5_hashtags_24_hours = ["monday", "tuesday", "wednesday", "thursday", "friday"]

            allow(Hashtag).to receive(:fetch_trending).and_return(top_5_hashtags_24_hours)

            actual = HashtagController.trending

            expect(actual).to eq(top_5_hashtags_24_hours) 
        end
    end

    describe ".get_by_hashtag" do
		context "given valid params hash that contain hashtag_text key" do
			it "should call hashtag_text value" do
				hashtag_text = "#monday"
				valid_params = {
					"hashtag_text" => hashtag_text
				}

				expect(Post).to receive(:fetch_by_hashtag_text).with(hashtag_text)

				HashtagController.get_by_hashtag_text(valid_params)
			end
        end
    end
end

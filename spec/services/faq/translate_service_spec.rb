require_relative './../../spec_helper.rb'

describe FaqModule::TranslateService do
    describe "#call" do
        context "Valid sentence" do
            it "Return translated sentence" do
                @translateService = FaqModule::TranslateService.new({'query' => 'sapo'})
                response = @translateService.call()
                expect(response).to match("the frog")
            end
        end
    end
end

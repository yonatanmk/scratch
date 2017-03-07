describe Mirror do
  it "should echo" do
    @mirror = Mirror.new
    @mirror.stub(:gets) { "phrase" }
    # expect(@mirror).to receive(:puts).with("enter something: ")
    # binding.pry
    @mirror.echo
    expect(@mirror.response).to eq("phrase")
  end
end

# describe '#is_it_your_birthday?' do
#   it "should return \"Happy Birthday\" if user input date matches today's date" do
#     date = Birthday.new
#     date.stub(:gets) {Date.today.strftime("%m/%d")}
#     expect(date.is_it_your_birthday?).to output("Happy Birthday!").to_stdout
#   end
#
#   it "should return \"It is just another day then.\" if user input date does not match today's date" do
#     date = Birthday.new
#     date.stub!(:gets) {Date.today.strftime("%m/%d").succ}
#     expect(date.is_it_your_birthday?).to output("It is just another day, then.").to_stdout
#   end
#
# end

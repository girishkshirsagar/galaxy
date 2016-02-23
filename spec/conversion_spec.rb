require "/home/user/galaxy/lib/conversion"
require "/home/user/galaxy/lib/roman"

describe "Conversation" do

 context "#input" do
  it "should set array of inputs" do
    conv = Conversion.new
    conv.input.is_a?(Array)
  end
 end

 context "#process" do 
  it "should process given input and set appropriate instance variables" do
    conv = Conversion.new
    conv.process
    conv.instance_variable_get("@glob").should eq "I"
    conv.instance_variable_get("@Silver").should eq 17.0
  end 
 end

 context "#calculate" do
   before :each do
     @conv = Conversion.new
     @conv.process
   end

   it "should return correct credits for valid question" do
      @conv.calculate("how much is pish tegj glob glob ?").should eq "pish tegj glob glob is 42.0"
   end

   it "should return error for invalid question" do
      @conv.calculate("how much wood could a woodchuck chuck if a woodchuck could chuck wood ?").should eq "I have no idea what you are talking about"
   end
 end
end

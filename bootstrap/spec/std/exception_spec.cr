#!/usr/bin/env bin/crystal -run
require "spec"

describe "Exception" do
  it "executes body if nothing raised" do
    y = 1
    x = begin
          1
        rescue
          y = 2
        end
    x.should eq(1)
    y.should eq(1)
  end

  it "executes rescue if something is raised conditionally" do
    y = 1
    x = 1
    x = begin
          y == 1 ? raise "Oh no!" : nil
          y = 2
        rescue
          y = 3
        end
    x.should eq(3)
    y.should eq(3)
  end

  it "executes rescue if something is raised unconditionally" do
    y = 1
    x = 1
    x = begin
          raise "Oh no!"
          y = 2
        rescue
          y = 3
        end
    x.should eq(3)
    y.should eq(3)
  end
end
require 'spec_helper'

describe "RHEL" do
  it "enables remote_syslog as a service" do
    expect(service("remote_syslog")).to be_enabled
  end
end
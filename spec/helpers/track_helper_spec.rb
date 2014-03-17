require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe TrackHelper do

    include TrackHelper
    include LinkToHelper

    describe 'when displaying notices for a search track' do

        before do
            @track_thing = FactoryGirl.build(:search_track)
        end

        it 'should create an already subscribed_notice' do
            already_subscribed_notice(@track_thing).should == 'You are already subscribed to <a href="/search/Example%20Query/newest/advanced">this search</a>'
        end

        it 'should create an email subscription notice' do
            subscribe_email_notice(@track_thing).should == 'You will now be emailed updates about <a href="/search/Example%20Query/newest/advanced">this search</a>'
        end

        it 'should create a following subscription notice' do
            subscribe_follow_notice(@track_thing).should == "You are now <a href=\"#{show_user_wall_path(:url_name => @track_thing.tracking_user.url_name)}\">following</a> updates about <a href=\"/search/Example%20Query/newest/advanced\">this search</a>"
        end

        it 'should create an unsubscribe notice' do
            unsubscribe_notice(@track_thing).should == "You are no longer following <a href=\"/search/Example%20Query/newest/advanced\">this search</a>"
        end

    end

    describe 'when displaying notices for a user track' do

        before do
            @track_thing = FactoryGirl.build(:user_track)
        end

        it 'should create an already subscribed_notice' do
            already_subscribed_notice(@track_thing).should == "You are already subscribed to '#{user_link(@track_thing.tracked_user)}', a person"
        end

        it 'should create an email subscription notice' do
            subscribe_email_notice(@track_thing).should == "You will now be emailed updates about '#{user_link(@track_thing.tracked_user)}', a person"
        end

        it 'should create a following subscription notice' do
            subscribe_follow_notice(@track_thing).should == "You are now <a href=\"#{show_user_wall_path(:url_name => @track_thing.tracking_user.url_name)}\">following</a> updates about '#{user_link(@track_thing.tracked_user)}', a person"
        end

        it 'should create an unsubscribe notice' do
            unsubscribe_notice(@track_thing).should == "You are no longer following '#{user_link(@track_thing.tracked_user)}', a person"
        end

    end

    describe 'when displaying notices for a public body track' do

        before do
            @track_thing = FactoryGirl.build(:public_body_track)
        end

        it 'should create an already subscribed_notice' do
            already_subscribed_notice(@track_thing).should == "You are already subscribed to '#{public_body_link(@track_thing.public_body)}', a public authority"
        end

        it 'should create an email subscription notice' do
            subscribe_email_notice(@track_thing).should == "You will now be emailed updates about '#{public_body_link(@track_thing.public_body)}', a public authority"
        end

        it 'should create a following subscription notice' do
            subscribe_follow_notice(@track_thing).should == "You are now <a href=\"#{show_user_wall_path(:url_name => @track_thing.tracking_user.url_name)}\">following</a> updates about '#{public_body_link(@track_thing.public_body)}', a public authority"
        end

        it 'should create an unsubscribe notice' do
            unsubscribe_notice(@track_thing).should == "You are no longer following '#{public_body_link(@track_thing.public_body)}', a public authority"
        end
    end

    describe 'when displaying notices for a successful request track' do

        before do
            @track_thing = FactoryGirl.build(:successful_request_track)
        end

        it 'should create an already subscribed_notice' do
            already_subscribed_notice(@track_thing).should == 'You are already subscribed to any <a href="/list/successful">successful requests</a>'
        end

        it 'should create an email subscription notice' do
            subscribe_email_notice(@track_thing).should == 'You will now be emailed updates about <a href="/list/successful">successful requests</a>'
        end

        it 'should create a following subscription notice' do
            subscribe_follow_notice(@track_thing).should == "You are now <a href=\"#{show_user_wall_path(:url_name => @track_thing.tracking_user.url_name)}\">following</a> updates about <a href=\"/list/successful\">successful requests</a>"
        end

        it 'should create an unsubscribe notice' do
            unsubscribe_notice(@track_thing).should == 'You are no longer following <a href="/list/successful">successful requests</a>'
        end

    end

    describe 'when displaying notices for a new request track' do

        before do
            @track_thing = FactoryGirl.build(:new_request_track)
        end

        it 'should create an already subscribed_notice' do
            already_subscribed_notice(@track_thing).should == 'You are already subscribed to any <a href="/list">new requests</a>'
        end

        it 'should create an email subscription notice' do
            subscribe_email_notice(@track_thing).should == 'You will now be emailed updates about any <a href="/list">new requests</a>'
        end

        it 'should create a following subscription notice' do
            subscribe_follow_notice(@track_thing).should == "You are now <a href=\"#{show_user_wall_path(:url_name => @track_thing.tracking_user.url_name)}\">following</a> updates about <a href=\"/list\">new requests</a>"
        end

        it 'should create an unsubscribe notice' do
            unsubscribe_notice(@track_thing).should == 'You are no longer following <a href="/list">new requests</a>'
        end

    end

    describe 'when displaying notices for a request update track' do

        before do
            @track_thing = FactoryGirl.build(:request_update_track)
        end

        it 'should create an already subscribed_notice' do
            already_subscribed_notice(@track_thing).should == "You are already subscribed to '#{request_link(@track_thing.info_request)}', a request"
        end

        it 'should create an email subscription notice' do
            subscribe_email_notice(@track_thing).should == "You will now be emailed updates about '#{request_link(@track_thing.info_request)}', a request"
        end

        it 'should create a following subscription notice' do
            subscribe_follow_notice(@track_thing).should == "You are now <a href=\"#{show_user_wall_path(:url_name => @track_thing.tracking_user.url_name)}\">following</a> updates about '#{request_link(@track_thing.info_request)}', a request"
        end

        it 'should create an unsubscribe notice' do
            unsubscribe_notice(@track_thing).should == "You are no longer following '#{request_link(@track_thing.info_request)}', a request"
        end

    end

end

require 'spec_helper'
require 'rr'
require 'vcr'

describe "Publish Integration Test" do

  before do
    @my_callback = lambda { |message| Rails.logger.debug(message) }
    @pn = Pubnub.new(:publish_key => :demo, :subscribe_key => :demo)
  end


  context "when it receives a non 200 response" do


      it "should return the native server error when its usable" do
        my_response = [0, "Message Too Large", "13619441967053834"]
        mock(@my_callback).call(my_response) {}

        VCR.use_cassette("integration_publish_11", :record => :none) do
          @pn.publish(:channel => :hello_world, :message => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi posuere arcu at arcu iaculis non faucibus nisl gravida. Duis ac enim tortor. Vestibulum euismod lobortis mauris, id hendrerit tellus sagittis sit amet. Curabitur accumsan sem quis metus mollis sed tristique enim mollis. Pellentesque eu est arcu, sit amet laoreet odio. Etiam hendrerit facilisis aliquam. Vivamus mollis mauris vitae purus placerat dictum. Vivamus nulla nunc, sagittis in scelerisque sed, ullamcorper volutpat diam. Duis et quam risus, at viverra nunc.Proin in eros velit, vitae porttitor justo. Fusce lobortis lacus vel odio viverra luctus. Nam vestibulum pellentesque ornare. Vivamus orci metus, convallis congue laoreet eget, faucibus nec magna. Curabitur ut tellus eu dolor imperdiet molestie sit amet quis tortor. Nam convallis turpis eu velit pulvinar vulputate. Donec mauris mauris, rhoncus id suscipit eget, porttitor id velit. Mauris luctus aliquet neque sit amet accumsan. Phasellus iaculis sapien nec nibh sodales vitae pulvinar urna fringilla. Vivamus id dolor lorem, et ultricies velit.Curabitur gravida pretium volutpat. Proin aliquet lacinia elit, ac interdum urna aliquet ut. Morbi et ipsum magna. Aliquam varius, arcu eget pulvinar condimentum, enim tellus eleifend quam, eget malesuada sapien metus sed massa. Cras aliquam consectetur libero, eu dictum ipsum adipiscing sed. Morbi nunc orci, gravida dictum ultricies eget, euismod ac elit. Proin sed eros eget lacus posuere malesuada ut non nibh. Nunc id metus velit. Phasellus varius venenatis accumsan. Cras molestie diam ut quam porta vitae mattis lorem sagittis. Donec consectetur urna at dui consequat laoreet. Integer accumsan accumsan vestibulum. In eleifend malesuada purus, eu interdum nulla pretium varius. Vestibulum a lacus risus, ac rutrum nisl. Quisque dictum nulla vitae odio consequat sed ultricies dui mattis.Maecenas quis ligula tortor, quis consequat augue. Aliquam malesuada ornare magna sit amet aliquam. Suspendisse eu augue eget mauris sodales blandit. Mauris eget odio ut mauris suscipit consequat. Donec mi risus, condimentum vestibulum commodo et, eleifend at diam. Duis facilisis risus in quam sagittis posuere. Suspendisse pulvinar mauris nec purus volutpat eget vestibulum orci mollis. In sodales mauris et purus dapibus mollis. Cras eget nulla tortor, a lacinia nulla. Nam vitae velit felis. Quisque eu consectetur quam. In hac habitasse platea dictumst. Donec sem lorem, accumsan id ullamcorper in, porta in massa.Nam sollicitudin ligula vel erat mattis congue lacinia orci ornare. Aliquam bibendum urna adipiscing quam porttitor faucibus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nullam vel mattis leo. In tincidunt vehicula felis ac pretium. Integer porttitor, neque sit amet sodales accumsan, elit nulla lobortis purus, sed dapibus justo tortor sit amet mauris. Duis mi leo, dapibus quis tempus nec, mollis nec nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Cras congue aliquam sem, nec luctus nibh imperdiet nec. Curabitur convallis, velit non vulputate tempus, lorem urna fermentum nibh, et iaculis enim ligula quis tellus. ", :callback => @my_callback)
        end
      end

      it "should return a custom error when its not" do

        my_response = [0, "Bad server response: 500"]
        mock(@my_callback).call(my_response) {}

        VCR.use_cassette("integration_publish_12", :record => :none) do
          @pn.publish(:channel => :hello_world, :message => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi posuere arcu at arcu iaculis non faucibus nisl gravida. Duis ac enim tortor. Vestibulum euismod lobortis mauris, id hendrerit tellus sagittis sit amet. Curabitur accumsan sem quis metus mollis sed tristique enim mollis. Pellentesque eu est arcu, sit amet laoreet odio. Etiam hendrerit facilisis aliquam. Vivamus mollis mauris vitae purus placerat dictum. Vivamus nulla nunc, sagittis in scelerisque sed, ullamcorper volutpat diam. Duis et quam risus, at viverra nunc.Proin in eros velit, vitae porttitor justo. Fusce lobortis lacus vel odio viverra luctus. Nam vestibulum pellentesque ornare. Vivamus orci metus, convallis congue laoreet eget, faucibus nec magna. Curabitur ut tellus eu dolor imperdiet molestie sit amet quis tortor. Nam convallis turpis eu velit pulvinar vulputate. Donec mauris mauris, rhoncus id suscipit eget, porttitor id velit. Mauris luctus aliquet neque sit amet accumsan. Phasellus iaculis sapien nec nibh sodales vitae pulvinar urna fringilla. Vivamus id dolor lorem, et ultricies velit.Curabitur gravida pretium volutpat. Proin aliquet lacinia elit, ac interdum urna aliquet ut. Morbi et ipsum magna. Aliquam varius, arcu eget pulvinar condimentum, enim tellus eleifend quam, eget malesuada sapien metus sed massa. Cras aliquam consectetur libero, eu dictum ipsum adipiscing sed. Morbi nunc orci, gravida dictum ultricies eget, euismod ac elit. Proin sed eros eget lacus posuere malesuada ut non nibh. Nunc id metus velit. Phasellus varius venenatis accumsan. Cras molestie diam ut quam porta vitae mattis lorem sagittis. Donec consectetur urna at dui consequat laoreet. Integer accumsan accumsan vestibulum. In eleifend malesuada purus, eu interdum nulla pretium varius. Vestibulum a lacus risus, ac rutrum nisl. Quisque dictum nulla vitae odio consequat sed ultricies dui mattis.Maecenas quis ligula tortor, quis consequat augue. Aliquam malesuada ornare magna sit amet aliquam. Suspendisse eu augue eget mauris sodales blandit. Mauris eget odio ut mauris suscipit consequat. Donec mi risus, condimentum vestibulum commodo et, eleifend at diam. Duis facilisis risus in quam sagittis posuere. Suspendisse pulvinar mauris nec purus volutpat eget vestibulum orci mollis. In sodales mauris et purus dapibus mollis. Cras eget nulla tortor, a lacinia nulla. Nam vitae velit felis. Quisque eu consectetur quam. In hac habitasse platea dictumst. Donec sem lorem, accumsan id ullamcorper in, porta in massa.Nam sollicitudin ligula vel erat mattis congue lacinia orci ornare. Aliquam bibendum urna adipiscing quam porttitor faucibus. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nullam vel mattis leo. In tincidunt vehicula felis ac pretium. Integer porttitor, neque sit amet sodales accumsan, elit nulla lobortis purus, sed dapibus justo tortor sit amet mauris. Duis mi leo, dapibus quis tempus nec, mollis nec nisl. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Cras congue aliquam sem, nec luctus nibh imperdiet nec. Curabitur convallis, velit non vulputate tempus, lorem urna fermentum nibh, et iaculis enim ligula quis tellus. ", :callback => @my_callback)
        end

      end

    end

  context "when it is successful" do

    context "with basic publish config" do

      it "should publish without ssl" do
        my_response = [1, "Sent", "13450923394327693"]
        mock(@my_callback).call(my_response) {}

        VCR.use_cassette("integration_publish_1", :record => :none) do
          @pn.publish(:channel => :hello_world, :message => "hi", :callback => @my_callback)
        end
      end

      it "should publish without ssl with custom origin" do
        my_response = [1, "Sent", "13619174360247577"]
        mock(@my_callback).call(my_response) {}

        VCR.use_cassette("integration_publish_10", :record => :none) do
          @pn.publish(:origin => "a.pubnub.com", :channel => :hello_world, :message => "hi", :callback => @my_callback)
        end
      end

      it "should publish with ssl" do

        my_response = [1, "Sent", "13451428018571368"]
        mock(@my_callback).call(my_response) {}

        @pn.ssl = true

        VCR.use_cassette("integration_publish_3", :record => :none) do
          @pn.publish(:channel => :hello_world, :message => "hi", :callback => @my_callback)
        end
      end

    end


    context "when there is a cipher key" do

      before do
        @pn.cipher_key = "enigma"
      end

      it "should publish without ssl (implicit)" do

        my_response = [1, "Sent", "13473285565926387"]
        mock(@my_callback).call(my_response) {}

        VCR.use_cassette("integration_publish_2", :record => :none) do
          @pn.publish(:channel => :hello_world, :message => "hi", :callback => @my_callback)
        end

      end

      it "should publish without ssl (explicit)" do

        my_response = [1, "Sent", "13473285565926387"]
        mock(@my_callback).call(my_response) {}

        @pn.ssl = false

        VCR.use_cassette("integration_publish_2", :record => :none) do
          @pn.publish(:channel => :hello_world, :message => "hi", :callback => @my_callback)
        end

      end

      context "ssl on" do

        context "message signing off" do

          it "should publish" do

            my_response = [1, "Sent", "13473286442585026"]
            mock(@my_callback).call(my_response) {}

            @pn.ssl = true
            @pn.secret_key = nil

            VCR.use_cassette("integration_publish_4", :record => :none) do
              @pn.publish(:channel => :hello_world, :message => "hi", :callback => @my_callback)
            end
          end

        end

        context "message signing on" do

          it "should publish" do

            my_response = [1, "Sent", "13473288269652075"]
            mock(@my_callback).call(my_response) {}

            @pn.ssl = true
            @pn.secret_key = "itsmysecret"

            VCR.use_cassette("integration_publish_5", :record => :none) do
              @pn.publish(:channel => :hello_world, :message => "hi", :callback => @my_callback)
            end
          end

        end

      end


    end

    context "when message signing is on" do

      before do
        @pn.secret_key = "enigma"
      end

      it "should publish without ssl (implicit)" do

        my_response = [1, "Sent", "13451493026321630"]
        mock(@my_callback).call(my_response) {}

        VCR.use_cassette("integration_publish_6", :record => :none) do
          @pn.publish(:channel => :hello_world, :message => "hi", :callback => @my_callback)
        end

      end

      it "should publish without ssl (explicit)" do

        my_response = [1, "Sent", "13451494117873005"]
        mock(@my_callback).call(my_response) {}

        @pn.ssl = false

        VCR.use_cassette("integration_publish_7", :record => :none) do
          @pn.publish(:channel => :hello_world, :message => "hi", :callback => @my_callback)
        end

      end

      context "ssl on" do

        context "cipher key off" do

          it "should publish" do

            my_response = [1, "Sent", "13451493874063684"]
            mock(@my_callback).call(my_response) {}

            @pn.ssl = true
            @pn.cipher_key = nil

            VCR.use_cassette("integration_publish_8", :record => :none) do
              @pn.publish(:channel => :hello_world, :message => "hi", :callback => @my_callback)
            end
          end

        end

        context "cipher key on" do

          it "should publish" do

            my_response = [1, "Sent", "13473284333280114"]
            mock(@my_callback).call(my_response) {}

            @pn.ssl = true
            @pn.cipher_key = "itsmysecret"

            VCR.use_cassette("integration_publish_9", :record => :none) do
              @pn.publish(:channel => :hello_world, :message => "hi", :callback => @my_callback)
            end
          end

        end
      end

    end
  end
end
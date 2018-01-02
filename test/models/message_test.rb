require "test_helper"

describe Message do
  describe "validations" do
    it "allows a message to be created with all required parameters" do
      start_count = Message.all.count

      message_data = {
        text: "hello world",
        from: 1,
        to: 2,
        language: "ru"
      }

      message = Message.new(message_data)
      message.save
      end_count = Message.all.count

      message.must_be :valid?
      end_count.must_equal start_count + 1
    end

    it "requires all required data to create a new message" do
      start_count = Message.all.count
      invalid_message_data = {
        text: ""
      }
      message = Message.new(invalid_message_data)
      message.save
      end_count = Message.all.count

      message.wont_be :valid?
      end_count.must_equal start_count
    end
  end
end
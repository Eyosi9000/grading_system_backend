RSpec.describe "/class_rooms", type: :request do

  let(:valid_attributes) do
    test_student = Student.create({
      first_name: Faker::Name.name,
      middle_name: Faker::Name.name,
      last_name: Faker::Name.name,
      email: Faker::Internet.email
    })
    test_course = Course.create({
      course_name: Faker::Lorem.word,
      course_description: Faker::Lorem.paragraph,
      credit_hour: 1,
      submission: true
    })
    test_instructor = Instructor.create({
      first_name: Faker::Name.name,
      middle_name: Faker::Name.name,
      last_name: Faker::Name.name,
      email: Faker::Internet.email
    })

    {
    student: test_student[:id],
    course: test_course[:id],
    instructor: test_instructor[:id],
    class_room_no: 1 ,
    semester: Faker::Lorem.word,
    grade: Faker::Lorem.characters(number: 1) 
    }
  end

  let(:invalid_attributes) do 
    {
    student: nil,
    course: nil,
    instructor: nil,
    class_room_no: 1 ,
    semester: Faker::Lorem.word,
    grade: Faker::Lorem.characters(number: 1) 
    }
  end

  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    it "renders a successful response" do
      3.times {create(:class_room)}
      get class_rooms_url, as: :json
      expect(response).to be_successful
      result = JSON(response.body)
      expect(result['data'].count).to eq 3
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      class_room = create(:class_room)
      get class_room_url(class_room), as: :json
      expect(response).to be_successful
      result = JSON(response.body)
      expect(result['success']).to be_truthy
      expect(result['data']['id']).to eq class_room.id
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new ClassRoom" do
        expect {
          post class_rooms_url,
               params: { class_room: valid_attributes }, as: :json
        }.to change(ClassRoom, :count).by(1)
      end

      it "renders a JSON response with the new class_room" do
        post class_rooms_url,
             params: { class_room: valid_attributes }, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new ClassRoom" do
        expect {
          post class_rooms_url,
               params: { class_room: invalid_attributes }, as: :json
        }.to change(ClassRoom, :count).by(0)
      end

      it "renders a JSON response with errors for the new class_room" do
        post class_rooms_url,
             params: { class_room: invalid_attributes }, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {
          semester: Faker::Lorem.word
        }
      }

      it "updates the requested class_room" do
        class_room = ClassRoom.create! valid_attributes
        patch class_room_url(class_room),
              params: { class_room: new_attributes }, as: :json
        class_room.reload
        skip("Add assertions for updated state")
      end

      it "renders a JSON response with the class_room" do
        class_room = ClassRoom.create! valid_attributes
        patch class_room_url(class_room),
              params: { class_room: new_attributes }, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the class_room" do
        class_room = ClassRoom.create! valid_attributes
        patch class_room_url(class_room),
              params: { class_room: invalid_attributes }, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  # describe "DELETE /destroy" do
  #   it "destroys the requested class_room" do
  #     class_room = ClassRoom.create! valid_attributes
  #     expect {
  #       delete class_room_url(class_room), headers: valid_headers, as: :json
  #     }.to change(ClassRoom, :count).by(-1)
  #   end
  # end
end

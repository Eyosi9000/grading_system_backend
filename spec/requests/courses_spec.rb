RSpec.describe "/courses", type: :request do

  let(:valid_attributes) do {
    course_name: Faker::Lorem.word,
    course_description: Faker::Lorem.paragraph,
    credit_hour: 1,
    submission: true
  }
  end

  let(:invalid_attributes) do {
    course_name: nil,
    course_description: Faker::Lorem.paragraph,
    credit_hour: 1,
    submission: true
  }
  end

  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    it "renders a successful response" do
      3.times { create(:course) }
      get courses_url, as: :json
      expect(response).to be_successful
      result = JSON(response.body)
      expect(result['data'].count).to eq 3
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      course = create(:course)
      get course_url(course), as: :json
      expect(response).to be_successful
      result = JSON(response.body)
      expect(result['success']).to be_truthy
      expect(result['data']['id']).to eq course.id
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Course" do
        expect {
          post courses_url,
               params: { course: valid_attributes }, as: :json
        }.to change(Course, :count).by(1)
      end

      it "renders a JSON response with the new course" do
        post courses_url,
             params: { course: valid_attributes }, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Course" do
        expect {
          post courses_url,
               params: { course: invalid_attributes }, as: :json
        }.to change(Course, :count).by(0)
      end

      it "renders a JSON response with errors for the new course" do
        post courses_url,
             params: { course: invalid_attributes }, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {
          course_name: Faker::Lorem.word
        }
      }

      it "updates the requested course" do
        course = Course.create! valid_attributes
        patch course_url(course),
              params: { course: new_attributes }, as: :json
        course.reload
        expect(course.course_name).to eq new_attributes[:course_name]
      end

      it "renders a JSON response with the course" do
        course = Course.create! valid_attributes
        patch course_url(course),
              params: { course: new_attributes }, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the course" do
        course = Course.create! valid_attributes
        patch course_url(course),
              params: { course: invalid_attributes }, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  # describe "DELETE /destroy" do
  #   it "destroys the requested course" do
  #     course = Course.create! valid_attributes
  #     expect {
  #       delete course_url(course), headers: valid_headers, as: :json
  #     }.to change(Course, :count).by(-1)
  #   end
  # end
end

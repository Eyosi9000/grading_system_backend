RSpec.describe "/students", type: :request do

  let(:valid_attributes) do {
    first_name: Faker::Name.name,
    middle_name: Faker::Name.name,
    last_name: Faker::Name.name,
    email: Faker::Internet.email
  }
  end


  let(:invalid_attributes) do {
    first_name: nil,
    middle_name: Faker::Name.name,
    last_name: Faker::Name.name,
    email: Faker::Internet.email
  }
  end

  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    it "renders a successful response" do
      3.times { create(:student) }
      get students_url, as: :json
      expect(response).to be_successful
      result = JSON(response.body)
      expect(result['data'].count).to eq 3
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      student = create(:student)
      get student_url(student), as: :json
      expect(response).to be_successful
      result = JSON(response.body)
      expect(result['success']).to be_truthy
      expect(result['data']['id']).to eq student.id
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Student" do
        expect {
          post students_url,
               params: { student: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Student, :count).by(1)
      end

      it "renders a JSON response with the new student" do
        post students_url,
             params: { student: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Student" do
        expect {
          post students_url,
               params: { student: invalid_attributes }, as: :json
        }.to change(Student, :count).by(0)
      end

      it "renders a JSON response with errors for the new student" do
        post students_url,
             params: { student: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {
          first_name: Faker::Name.name
        }
      }

      it "updates the requested student" do
        student = Student.create! valid_attributes
        patch student_url(student),
              params: { student: new_attributes }, headers: valid_headers, as: :json
        student.reload
        expect(student.first_name).to eq new_attributes[:first_name]
      end

      it "renders a JSON response with the student" do
        student = Student.create! valid_attributes
        patch student_url(student),
              params: { student: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the student" do
        student = Student.create! valid_attributes
        patch student_url(student),
              params: { student: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  # describe "DELETE /destroy" do
  #   it "destroys the requested student" do
  #     student = Student.create! valid_attributes
  #     expect {
  #       delete student_url(student), headers: valid_headers, as: :json
  #     }.to change(Student, :count).by(-1)
  #   end
  # end
end

# frozen_string_literal: true

require 'test_helper'

class EmploymentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @employment = employments(:one)
  end

  test 'should get index' do
    get employments_url
    assert_response :success
  end

  test 'should get new' do
    get new_employment_url
    assert_response :success
  end

  test 'should create employment' do
    assert_difference('Employment.count') do
      post employments_url,
           params: {
             employment: { date_employment_ended: @employment.date_employment_ended, date_started: @employment.date_started,
                           employee_id: @employment.employee_id, employer: @employment.employer }, format: :turbo_stream
           }
    end

    assert_response :success
  end

  test 'should not save employment without employer' do
    employment = Employment.new
    assert_not employment.save, 'Saved the employment without a employer'
  end

  test 'should show employment' do
    get employment_url(@employment)
    assert_response :success
  end

  test 'should get edit' do
    get edit_employment_url(@employment)
    assert_response :success
  end

  test 'should update employment' do
    patch employment_url(@employment),
          params: {
            employment: { date_employment_ended: @employment.date_employment_ended, date_started: @employment.date_started,
                          employee_id: @employment.employee_id, employer: @employment.employer }, format: :turbo_stream
          }
    assert_response :success
  end

  test 'should destroy employment' do
    assert_difference('Employment.count', -1) do
      delete employment_url(@employment)
    end

    assert_redirected_to employments_url
  end
end

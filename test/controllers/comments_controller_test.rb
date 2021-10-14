require "test_helper"

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @comment = comments(:one)
  end

  test "should get index" do
    get comments_url
    assert_response :success
  end

  test "should get new" do
    get new_comment_url
    assert_response :success
  end

  test "should create _comment.html.erb" do
    assert_difference('Comment.count') do
      post comments_url, params: { comment: { body: @comment.body, email: @comment.email, meal_id: @comment.meal_id, name: @comment.name } }
    end

    assert_redirected_to comment_url(Comment.last)
  end

  test "should show _comment.html.erb" do
    get comment_url(@comment)
    assert_response :success
  end

  test "should get edit" do
    get edit_comment_url(@comment)
    assert_response :success
  end

  test "should update _comment.html.erb" do
    patch comment_url(@comment), params: { comment: { body: @comment.body, email: @comment.email, meal_id: @comment.meal_id, name: @comment.name } }
    assert_redirected_to comment_url(@comment)
  end

  test "should destroy _comment.html.erb" do
    assert_difference('Comment.count', -1) do
      delete comment_url(@comment)
    end

    assert_redirected_to comments_url
  end
end

require 'test_helper'

class InventariadosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @inventariado = inventariados(:one)
  end

  test "should get index" do
    get inventariados_url
    assert_response :success
  end

  test "should get new" do
    get new_inventariado_url
    assert_response :success
  end

  test "should create inventariado" do
    assert_difference('Inventariado.count') do
      post inventariados_url, params: { inventariado: {  } }
    end

    assert_redirected_to inventariado_url(Inventariado.last)
  end

  test "should show inventariado" do
    get inventariado_url(@inventariado)
    assert_response :success
  end

  test "should get edit" do
    get edit_inventariado_url(@inventariado)
    assert_response :success
  end

  test "should update inventariado" do
    patch inventariado_url(@inventariado), params: { inventariado: {  } }
    assert_redirected_to inventariado_url(@inventariado)
  end

  test "should destroy inventariado" do
    assert_difference('Inventariado.count', -1) do
      delete inventariado_url(@inventariado)
    end

    assert_redirected_to inventariados_url
  end
end

has_valid_license () {
  response=$(curl -sb -H "Accept: application/json" "https://api.gumroad.com/v2/licenses/verify"  -d "product_permalink=better-vim" -d "license_key=${BETTER_VIM_LICENSE}" -X POST)
  isValid=$(echo $response | jq '.success')
  echo $isValid
}

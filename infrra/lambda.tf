# todo add aws_iam_role with policies

resource "aws_lambda_function" "my_lambda" {
  function_name = "my_lambda"
  role          = aws_iam_role.my_lambda.arn
  handler       = "app.lambda_handler"
  runtime       = "python3.8"
  timeout       = 60
  image_uri     = "${aws_ecr_repository.repo.repository_url}:latest"
}

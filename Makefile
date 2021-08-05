AWS_ACCOUNT_ID := 111111
AWS_REGION := eu-west-1
ECR_REPO := lambda-example
AWS_PROFILE := staging

build:
	docker build -t my-lambda:latest .

run: build
	docker run -p 9000:8080 my-lambda:latest

invoke:
	curl -XPOST "http://localhost:9000/2015-03-31/functions/function/invocations" -d '{}'

publish-to-ecr: ecr-login
	docker tag my-lambda:latest ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${ECR_REPO}:latest
	# docker push ${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${ECR_REPO}:latest

ecr-login:
	$$(awsudo -u ${AWS_PROFILE} aws ecr get-login --no-include-email)

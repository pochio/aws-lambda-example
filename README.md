
AWS Lambda のお勉強

進捗、イマココ

https://docs.aws.amazon.com/ja_jp/lambda/latest/dg/python-programming-model-handler-types.html

```bash
make build
aws lambda update-function-code \
    --function-name LAMBDA_FUNCTION_NAME \
    --zip-file fileb://deployment-package.zip
```


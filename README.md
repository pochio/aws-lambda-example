
AWS Lambda のお勉強

## あとで

- API Gateway > Lambda > なにか
- S3 > Lambda > なにか
- ほか業務上で必要ようなコード類の作成 > ローカルの GitLab に置く

## 環境構築

- Amazon Linux 2

```bash
sudo amazon-linux-extras install epel
sudo yum -y install ansible
ansible-playbook -i localhost, -c local playbook.yml
mkdir project ; cd $_
pipenv --python 3.6.6
pipenv shell
python -V
 #->Python 3.6.6
```

## AWS Lanbda のドキュメントメモ

https://docs.aws.amazon.com/ja_jp/lambda/latest/dg/welcome.html

```bash
make build
aws lambda update-function-code \
    --function-name LAMBDA_FUNCTION_NAME \
    --zip-file fileb://deployment-package.zip
```

### Lambda 関数ハンドラー

https://docs.aws.amazon.com/ja_jp/lambda/latest/dg/python-programming-model-handler-types.html

```python
def handler_name(event, context): 
    ...
    return some_value
```

- event
  - AWS Lambda はこのパラメーターを使用してイベントデータをハンドラーに渡します。このパラメータは通常、Python の dict タイプです。また、list、str、int、float、または NoneType タイプを使用できます。
- context
  - AWS Lambda はこのパラメーターを使用してランタイム情報をハンドラーに提供します。このパラメータは LambdaContext タイプになります。
- オプション
  - ハンドラーは値を返すことができます。Lambda 関数の呼び出しに使用した呼び出しタイプに応じて、戻り値は次のようになります。
    - RequestResponse 呼び出しタイプ (同期実行) を使用する場合、AWS Lambda は Python 関数呼び出しの結果を、Lambda 関数を呼び出したクライアントに返します (呼び出しリクエストに対する HTTP レスポンスでは、JSON にシリアル化されます)。たとえば、AWS Lambda コンソールは RequestResponse 呼び出しタイプを使用するため、コンソールを使用して関数を呼び出すと、コンソールに戻り値が表示されます。
    - ハンドラが NONE を返した場合、AWS Lambda は null を返します。
    - Event 呼び出しタイプ (非同期実行) を使用すると、値は破棄されます。

### Context オブジェクト

https://docs.aws.amazon.com/ja_jp/lambda/latest/dg/python-context-object.html

- AWS Lambda が Lambda 関数を終了するまでの残り時間 (タイムアウトは Lambda 関数の設定プロパティの 1 つです)。
- 実行中の Lambda 関数に関連付けられた CloudWatch ロググループとログのストリーム。
- Lambda 関数を呼び出したクライアントに返された AWS リクエスト ID。AWS サポートで、フォローアップの問い合わせにリクエスト ID を使用できます。
- Lambda 関数が AWS Mobile SDK を通して呼び出された場合は、Lambda 関数を呼び出すモバイルアプリケーションの詳細を知ることができます。

### ログ記録 (Python)

https://docs.aws.amazon.com/ja_jp/lambda/latest/dg/python-logging.html

























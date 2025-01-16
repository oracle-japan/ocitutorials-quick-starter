# 106 : Oracle Database 23ai と LangChain で RAG を構成してみよう

## How to use?

> [!NOTE]
> 以下の作業は、Cloud Shell で実行することを推奨します。

`variables.auto.tfvars.sample` をコピーし、`variables.auto.tfvars` を作成します。

```sh
cp variables.auto.tfvars.sample variables.auto.tfvars
```

`variables.auto.tfvars` の中身を修正します。

```tf
region              = "<使用するリージョン（e.g. ap-osaka-1）>"
compartment_ocid    = "<コンパートメントID>"
prefix              = "<リソースにつける接頭辞>"
attendee            = <ハンズオンの参加者数>
ssh_authorized_keys = "<SSH接続に必要な公開鍵（集合ハンズオンの場合は、講師から鍵を受領してください）>"
contact_email       = "<メールアドレス>"
adb_admin_password  = "<ADBの管理者用パスワード>"
```

Cloud Shell を用いて Terraform を実行します。

```sh
terraform apply
```

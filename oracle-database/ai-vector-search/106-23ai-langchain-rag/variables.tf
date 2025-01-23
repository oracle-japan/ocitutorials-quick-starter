variable "tenancy_ocid" {
  description = "テナンシーOCID"
}

variable "region" {
  description = "作成予定のリージョン"
}

variable "compartment_ocid" {
  description = "コンパートメントID"
}

variable "prefix" {
  description = "作成されるリソースに付与する接頭辞"
}

variable "attendee" {
  default     = 1
  description = "参加者数"
}

variable "ssh_authorized_keys" {
  description = "SSH用の公開鍵"
}

variable "adb_admin_password" {
  description = "ADBの管理者用パスワード"
  sensitive   = true
}

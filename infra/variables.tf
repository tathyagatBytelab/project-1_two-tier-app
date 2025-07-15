variable "frontend_ecr_repo" {
  default = "pgagi-frontend"
}

variable "aws_account_id" {
  description = "AWS Account ID"
  type        = string
  default     = "011528284123"
}

variable "region" {
  description = "AWS Region"
  type        = string
  default     = "ap-south-1"
}



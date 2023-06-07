data "aws_region" "current" {}

data "aws_availability_zones" "available_zones" {
  state = "available"
}
data "aws_caller_identity" "current" {}


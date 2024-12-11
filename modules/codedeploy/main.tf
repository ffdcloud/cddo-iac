resource "aws_codedeploy_application" "app" {
  name = "${var.application_name}-app"
  compute_platform = "Server"
}

resource "aws_codedeploy_deployment_group" "deployment_group" {
  app_name              = aws_codedeploy_application.app.name
  deployment_group_name = "${var.application_name}-deployment-group"
  service_role_arn      = var.codedeploy_service_role_arn

  deployment_config_name = "CodeDeployDefault.OneAtATime"

  ec2_tag_set {
    ec2_tag_filter {
      key   = "Name"
      type  = "KEY_AND_VALUE"
      value = "${var.ec2_instance_name}"
    }
  }

  auto_rollback_configuration {
    enabled = true
    events  = ["DEPLOYMENT_FAILURE"]
  }
}

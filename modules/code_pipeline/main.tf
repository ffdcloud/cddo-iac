resource "aws_codepipeline" "pipeline" {
  name     = "${var.application_name}-pipeline"
  role_arn = var.codepipeline_service_role_arn

  artifact_store {
    location = var.s3_bucket_name
    type     = "S3"
  }

// Change this to GitHub
  stage {
    name = "Source"

    action {
      name             = "Source"
      category         = "Source"
      owner            = "AWS"
      provider         = "S3"
      version          = "1"
      output_artifacts = ["source_output"]

      configuration = {
        S3Bucket = var.s3_bucket_name
        S3ObjectKey = var.source_object_key
      }
    }
  }

  stage {
    name = "Deploy"

    action {
      name            = "Deploy"
      category        = "Deploy"
      owner           = "AWS"
      provider        = "CodeDeploy"
      version         = "1"
      input_artifacts = ["source_output"]

      configuration = {
        ApplicationName     = aws_codedeploy_application.app.name
        DeploymentGroupName = aws_codedeploy_deployment_group.deployment_group.deployment_group_name
      }
    }
  }
}
locals {
  codepipeline_name = "codepipeline-${var.app_name}-${var.env_name}"
}

resource "aws_codepipeline" "codepipeline" {
  name     = local.codepipeline_name
  role_arn = aws_iam_role.codepipeline_role.arn

  artifact_store {
    location = var.s3_bucket
    type     = "S3"
  }

  stage {
    name = "Source"
    action {
      name             = "Download_Merged_Sources"
      category         = "Source"
      owner            = "AWS"
      provider         = "S3"
      version          = "1"
      output_artifacts = ["source_output"]

      configuration = {
        S3Bucket = "${var.s3_bucket}"
        S3ObjectKey = "${var.env_name}/source_artifacts.zip" 
        PollForSourceChanges = true
      }
    }
  }

  stage {
    name = "SAM-Build"
      action {
        name             = "SAM-Build"
        category         = "Build"
        owner            = "AWS"
        provider         = "CodeBuild"
        input_artifacts  = ["source_output"]
        version          = "1"
        output_artifacts = ["build_output"]

        configuration = {
          ProjectName = "codebuild-sam-build-${var.env_name}"
        }

      }
    }
  

  stage {
    name = "SAM-Deploy"
      action {
        name             = "SAM-Deploy"
        category         = "Build"
        owner            = "AWS"
        provider         = "CodeBuild"
        input_artifacts  = ["build_output"]
        version          = "1"

        configuration = {
          ProjectName = "codebuild-sam-deploy-${var.env_name}"
        }

      }
    }
    depends_on = [
      aws_iam_role.codepipeline_role,
      aws_iam_role_policy.codepipeline_policy
    ]
  }

resource "aws_iam_role" "codepipeline_role" {
  name               = "${local.codepipeline_name}-role"
  assume_role_policy = data.aws_iam_policy_document.codepipeline_assume_role_policy.json
  depends_on = [
    data.aws_iam_policy_document.codepipeline_assume_role_policy
  ]
}

resource "aws_iam_role_policy" "codepipeline_policy" {
  name   = "codepipeline_policy"
  role   = aws_iam_role.codepipeline_role.id
  policy = data.aws_iam_policy_document.codepipeline_role_policy.json
  depends_on = [
    data.aws_iam_policy_document.codepipeline_role_policy
  ]
}


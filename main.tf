provider "aws" {

    region = "us-east-1"

  
}
data "aws_iam_policy_document" "example" {
  statement {
    actions   = ["s3:ListAllMyBuckets"]
    resources = ["arn:aws:s3:::*"]
    effect = "Allow"
  }
}

terraform {
    backend "s3" { 
        encrypt = true
        bucket = "network-logfiles"
        dynamodb_table = "tf-state-lock-dynamo"
        key = "aws_iam/terraform.tfstate"
        region = "us-east-1"
    }
}



module "iam_policy"{
    source = "./iam_policy"

    policyname="newPolicy"
    policydescription="this is a test policy"

    policystring= data.aws_iam_policy_document.example.json
    
}

module "iam_roles"{
    source = "./iam_roles"
    rolename="IamRole"
    
    //tags= ""

}
module "iam_user"{
    source = "./iam_user"
    username="johnbinco"
    

}
module "instance_profile"{
    source = "./instance_profile"
    instanceprofilename="Instance"
    rolename="IamRole"

}

module "iam_group"{
    source = "./iam_group"
    groupname ="IAMGroup"

}

module "iam_group_membership"{
    source = "./iam_group_membership"

    users = ["johnbinco"]
    group = "IAMGroup"
    membershipname = "IAMGroupMem"

}

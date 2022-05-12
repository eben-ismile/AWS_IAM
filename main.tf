provider "aws" {
    region = "us-east-1"

  
}



module iam_group{
    source = "./iam_group"
    groupname =" "

}

module iam_group_membership{
    source = "./iam_group_membership"

    users = " "
    group = " "
    membershipname = ""

}

module iam_policy{
    source = "./policy"
    policyname=""
    policydescription=""
    policystring=""
    

}
module iam_roles{
    source = "./iam_roles"
    rolename=""
    tags= ""

}
module iam_user{
    source = "./iam_user"
    username=""
    tags=""

}
module instance_profile{
    source = "./instance_profile"
    instanceprofilename=""
    rolename=""

}
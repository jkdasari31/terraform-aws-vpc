data "aws_availability_zones" "azs" {
    #all_availability_zones = true
    state = "available"
}

data "aws_vpc" "default" {  # data source to get the default VPC id (i Used at peering time from roboshop VPC to default VPC)
  default = true
}

data "aws_route_table" "default" {  # data source to get the default Route Table id
    vpc_id = data.aws_vpc.default.id  # for the default  VPC id (Grep the flow "aws_vpc" "default" . id)
    filter {
        name = "association.main"
        values = ["true"]
    }
}
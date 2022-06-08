terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

# Create a VPC
resource "aws_vpc" "dev_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    "Name" = "Development Enviroment"
  }
}

resource "aws_subnet" "web_tier_subnet" {
  vpc_id     = aws_vpc.dev_vpc.id
  cidr_block = "10.0.0.0/27"
  tags = {
    Name = "web Tier Subnet"
  }
}
resource "aws_subnet" "app_tier_subnet" {
  vpc_id     = aws_vpc.dev_vpc.id
  cidr_block = "10.0.0.32/27"
  tags = {
    Name = "App Tier Subnet"
  }
}
resource "aws_subnet" "db_tier_subnet" {
  vpc_id     = aws_vpc.dev_vpc.id
  cidr_block = "10.0.0.64/28"
  tags = {
    Name = "DB Tier Subnet"
  }
}
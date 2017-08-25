# learn-terraform
My experience learning Terraform.

## How to use

### Installation

+ Virtualbox

```
brew install virtualbox
```

+ Vagrant

```
brew install vagrant
```

### Run

``` shell
vagrant ssh
$ cd /synced/Base
$ terraform plan
$ terraform apply
```

## Commands

Check the status of one instance via AWS EC2 cli.

```
$ aws ec2 describe-instance-status --instance-ids i-021296f980e04a525
```

You can change the `tags` values and check if was really changed by Terraform.

```
$ aws ec2 describe-tags | less
```

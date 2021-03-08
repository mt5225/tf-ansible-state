environment = "cloudj-prod-usw2"
key_name = "snow"
subnet_ids  = {
    nat1 = "subnet-b3019ed6", # prod network 02
    nat2 = "", # prod network 02
    db = ""
}

vpc_security_group_ids = {
    web = ["sg-08c2fdb4cbaafe520"],
    db = ["sg-08c2fdb4cbaafe520"],
}
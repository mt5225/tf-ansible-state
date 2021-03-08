import json

with open("../states/terraform.tfstate") as f:
    fj_obj = json.loads(f.read())
    act2msg = {}
    for p in fj_obj["resources"]:
        if p["type"] == "saltstack_host":
            print(p)
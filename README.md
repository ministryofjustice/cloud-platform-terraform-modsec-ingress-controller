# cloud-platform-terraform-ingress-controller

[![Releases](https://img.shields.io/github/release/ministryofjustice/cloud-platform-terraform-modsec-ingress-controller/all.svg?style=flat-square)](https://github.com/ministryofjustice/cloud-platform-terraform-modsec-ingress-controller/releases)

Terraform module used by the Cloud Platform team to create an ingress-controller with modsecurity enabled.

## Usage

```hcl
module "ingress_controller" {
  source = "github.com/ministryofjustice/cloud-platform-terraform-teams-modsec-controller?ref=0.0.1"
  controller_name = "modsec01"

  replica_count = "3"
  dependence_prometheus  = module.prometheus.helm_prometheus_operator_status
  dependence_certmanager = module.cert_manager.helm_cert_manager_status
}
```

## Inputs


## Inputs

| Name                   | Description                                                                        | Type   | Default | Required |
|------------------------|------------------------------------------------------------------------------------|:------:|:-------:|:--------:|
| controller_name        | Name of the controller, will appear as an annotation for dedicated ingress         | string |    ""   |    yes   |
| replica_count          | How many replicas you require in your namespace                                    | string |    ""   |    yes   |
| dependence_prometheus  | When deployed integration_test nginx ingress controller, if prometheus is not deployed before this module fails because it installs serviceMonitor (CRD from prometheus) | string | "NOTHING"  |  no   |
| dependence_certmanager | When deployed integration_test nginx ingress controller, if certmanager is not deployed before this module fails because it uses certmanager defaultCertificate | string | "NOTHING"  |  no   |

## Outputs

This module doesn't have outputs

resource "kubernetes_manifest" "customresourcedefinition_pgupgrades_postgres_operator_crunchydata_com" {
  manifest = {
    "apiVersion" = "apiextensions.k8s.io/v1"
    "kind" = "CustomResourceDefinition"
    "metadata" = {
      "annotations" = {
        "controller-gen.kubebuilder.io/version" = "v0.8.0"
      }
      "labels" = {
        "app.kubernetes.io/name" = "pgo"
        "app.kubernetes.io/version" = "5.1.0"
      }
      "name" = "pgupgrades.postgres-operator.crunchydata.com"
    }
    "spec" = {
      "group" = "postgres-operator.crunchydata.com"
      "names" = {
        "kind" = "PGUpgrade"
        "listKind" = "PGUpgradeList"
        "plural" = "pgupgrades"
        "singular" = "pgupgrade"
      }
      "scope" = "Namespaced"
      "versions" = [
        {
          "name" = "v1beta1"
          "schema" = {
            "openAPIV3Schema" = {
              "description" = "PGUpgrade is the Schema for the pgupgrades API"
              "properties" = {
                "apiVersion" = {
                  "description" = "APIVersion defines the versioned schema of this representation of an object. Servers should convert recognized schemas to the latest internal value, and may reject unrecognized values. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#resources"
                  "type" = "string"
                }
                "kind" = {
                  "description" = "Kind is a string value representing the REST resource this object represents. Servers may infer this from the endpoint the client submits requests to. Cannot be updated. In CamelCase. More info: https://git.k8s.io/community/contributors/devel/sig-architecture/api-conventions.md#types-kinds"
                  "type" = "string"
                }
                "metadata" = {
                  "type" = "object"
                }
                "spec" = {
                  "description" = "PGUpgradeSpec defines the desired state of PGUpgrade"
                  "properties" = {
                    "affinity" = {
                      "description" = "Scheduling constraints of the PGUpgrade pod. More info: https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node"
                      "properties" = {
                        "nodeAffinity" = {
                          "description" = "Describes node affinity scheduling rules for the pod."
                          "properties" = {
                            "preferredDuringSchedulingIgnoredDuringExecution" = {
                              "description" = "The scheduler will prefer to schedule pods to nodes that satisfy the affinity expressions specified by this field, but it may choose a node that violates one or more of the expressions. The node that is most preferred is the one with the greatest sum of weights, i.e. for each node that meets all of the scheduling requirements (resource request, requiredDuringScheduling affinity expressions, etc.), compute a sum by iterating through the elements of this field and adding \"weight\" to the sum if the node matches the corresponding matchExpressions; the node(s) with the highest sum are the most preferred."
                              "items" = {
                                "description" = "An empty preferred scheduling term matches all objects with implicit weight 0 (i.e. it's a no-op). A null preferred scheduling term matches no objects (i.e. is also a no-op)."
                                "properties" = {
                                  "preference" = {
                                    "description" = "A node selector term, associated with the corresponding weight."
                                    "properties" = {
                                      "matchExpressions" = {
                                        "description" = "A list of node selector requirements by node's labels."
                                        "items" = {
                                          "description" = "A node selector requirement is a selector that contains values, a key, and an operator that relates the key and values."
                                          "properties" = {
                                            "key" = {
                                              "description" = "The label key that the selector applies to."
                                              "type" = "string"
                                            }
                                            "operator" = {
                                              "description" = "Represents a key's relationship to a set of values. Valid operators are In, NotIn, Exists, DoesNotExist. Gt, and Lt."
                                              "type" = "string"
                                            }
                                            "values" = {
                                              "description" = "An array of string values. If the operator is In or NotIn, the values array must be non-empty. If the operator is Exists or DoesNotExist, the values array must be empty. If the operator is Gt or Lt, the values array must have a single element, which will be interpreted as an integer. This array is replaced during a strategic merge patch."
                                              "items" = {
                                                "type" = "string"
                                              }
                                              "type" = "array"
                                            }
                                          }
                                          "required" = [
                                            "key",
                                            "operator",
                                          ]
                                          "type" = "object"
                                        }
                                        "type" = "array"
                                      }
                                      "matchFields" = {
                                        "description" = "A list of node selector requirements by node's fields."
                                        "items" = {
                                          "description" = "A node selector requirement is a selector that contains values, a key, and an operator that relates the key and values."
                                          "properties" = {
                                            "key" = {
                                              "description" = "The label key that the selector applies to."
                                              "type" = "string"
                                            }
                                            "operator" = {
                                              "description" = "Represents a key's relationship to a set of values. Valid operators are In, NotIn, Exists, DoesNotExist. Gt, and Lt."
                                              "type" = "string"
                                            }
                                            "values" = {
                                              "description" = "An array of string values. If the operator is In or NotIn, the values array must be non-empty. If the operator is Exists or DoesNotExist, the values array must be empty. If the operator is Gt or Lt, the values array must have a single element, which will be interpreted as an integer. This array is replaced during a strategic merge patch."
                                              "items" = {
                                                "type" = "string"
                                              }
                                              "type" = "array"
                                            }
                                          }
                                          "required" = [
                                            "key",
                                            "operator",
                                          ]
                                          "type" = "object"
                                        }
                                        "type" = "array"
                                      }
                                    }
                                    "type" = "object"
                                  }
                                  "weight" = {
                                    "description" = "Weight associated with matching the corresponding nodeSelectorTerm, in the range 1-100."
                                    "format" = "int32"
                                    "type" = "integer"
                                  }
                                }
                                "required" = [
                                  "preference",
                                  "weight",
                                ]
                                "type" = "object"
                              }
                              "type" = "array"
                            }
                            "requiredDuringSchedulingIgnoredDuringExecution" = {
                              "description" = "If the affinity requirements specified by this field are not met at scheduling time, the pod will not be scheduled onto the node. If the affinity requirements specified by this field cease to be met at some point during pod execution (e.g. due to an update), the system may or may not try to eventually evict the pod from its node."
                              "properties" = {
                                "nodeSelectorTerms" = {
                                  "description" = "Required. A list of node selector terms. The terms are ORed."
                                  "items" = {
                                    "description" = "A null or empty node selector term matches no objects. The requirements of them are ANDed. The TopologySelectorTerm type implements a subset of the NodeSelectorTerm."
                                    "properties" = {
                                      "matchExpressions" = {
                                        "description" = "A list of node selector requirements by node's labels."
                                        "items" = {
                                          "description" = "A node selector requirement is a selector that contains values, a key, and an operator that relates the key and values."
                                          "properties" = {
                                            "key" = {
                                              "description" = "The label key that the selector applies to."
                                              "type" = "string"
                                            }
                                            "operator" = {
                                              "description" = "Represents a key's relationship to a set of values. Valid operators are In, NotIn, Exists, DoesNotExist. Gt, and Lt."
                                              "type" = "string"
                                            }
                                            "values" = {
                                              "description" = "An array of string values. If the operator is In or NotIn, the values array must be non-empty. If the operator is Exists or DoesNotExist, the values array must be empty. If the operator is Gt or Lt, the values array must have a single element, which will be interpreted as an integer. This array is replaced during a strategic merge patch."
                                              "items" = {
                                                "type" = "string"
                                              }
                                              "type" = "array"
                                            }
                                          }
                                          "required" = [
                                            "key",
                                            "operator",
                                          ]
                                          "type" = "object"
                                        }
                                        "type" = "array"
                                      }
                                      "matchFields" = {
                                        "description" = "A list of node selector requirements by node's fields."
                                        "items" = {
                                          "description" = "A node selector requirement is a selector that contains values, a key, and an operator that relates the key and values."
                                          "properties" = {
                                            "key" = {
                                              "description" = "The label key that the selector applies to."
                                              "type" = "string"
                                            }
                                            "operator" = {
                                              "description" = "Represents a key's relationship to a set of values. Valid operators are In, NotIn, Exists, DoesNotExist. Gt, and Lt."
                                              "type" = "string"
                                            }
                                            "values" = {
                                              "description" = "An array of string values. If the operator is In or NotIn, the values array must be non-empty. If the operator is Exists or DoesNotExist, the values array must be empty. If the operator is Gt or Lt, the values array must have a single element, which will be interpreted as an integer. This array is replaced during a strategic merge patch."
                                              "items" = {
                                                "type" = "string"
                                              }
                                              "type" = "array"
                                            }
                                          }
                                          "required" = [
                                            "key",
                                            "operator",
                                          ]
                                          "type" = "object"
                                        }
                                        "type" = "array"
                                      }
                                    }
                                    "type" = "object"
                                  }
                                  "type" = "array"
                                }
                              }
                              "required" = [
                                "nodeSelectorTerms",
                              ]
                              "type" = "object"
                            }
                          }
                          "type" = "object"
                        }
                        "podAffinity" = {
                          "description" = "Describes pod affinity scheduling rules (e.g. co-locate this pod in the same node, zone, etc. as some other pod(s))."
                          "properties" = {
                            "preferredDuringSchedulingIgnoredDuringExecution" = {
                              "description" = "The scheduler will prefer to schedule pods to nodes that satisfy the affinity expressions specified by this field, but it may choose a node that violates one or more of the expressions. The node that is most preferred is the one with the greatest sum of weights, i.e. for each node that meets all of the scheduling requirements (resource request, requiredDuringScheduling affinity expressions, etc.), compute a sum by iterating through the elements of this field and adding \"weight\" to the sum if the node has pods which matches the corresponding podAffinityTerm; the node(s) with the highest sum are the most preferred."
                              "items" = {
                                "description" = "The weights of all of the matched WeightedPodAffinityTerm fields are added per-node to find the most preferred node(s)"
                                "properties" = {
                                  "podAffinityTerm" = {
                                    "description" = "Required. A pod affinity term, associated with the corresponding weight."
                                    "properties" = {
                                      "labelSelector" = {
                                        "description" = "A label query over a set of resources, in this case pods."
                                        "properties" = {
                                          "matchExpressions" = {
                                            "description" = "matchExpressions is a list of label selector requirements. The requirements are ANDed."
                                            "items" = {
                                              "description" = "A label selector requirement is a selector that contains values, a key, and an operator that relates the key and values."
                                              "properties" = {
                                                "key" = {
                                                  "description" = "key is the label key that the selector applies to."
                                                  "type" = "string"
                                                }
                                                "operator" = {
                                                  "description" = "operator represents a key's relationship to a set of values. Valid operators are In, NotIn, Exists and DoesNotExist."
                                                  "type" = "string"
                                                }
                                                "values" = {
                                                  "description" = "values is an array of string values. If the operator is In or NotIn, the values array must be non-empty. If the operator is Exists or DoesNotExist, the values array must be empty. This array is replaced during a strategic merge patch."
                                                  "items" = {
                                                    "type" = "string"
                                                  }
                                                  "type" = "array"
                                                }
                                              }
                                              "required" = [
                                                "key",
                                                "operator",
                                              ]
                                              "type" = "object"
                                            }
                                            "type" = "array"
                                          }
                                          "matchLabels" = {
                                            "additionalProperties" = {
                                              "type" = "string"
                                            }
                                            "description" = "matchLabels is a map of {key,value} pairs. A single {key,value} in the matchLabels map is equivalent to an element of matchExpressions, whose key field is \"key\", the operator is \"In\", and the values array contains only \"value\". The requirements are ANDed."
                                            "type" = "object"
                                          }
                                        }
                                        "type" = "object"
                                      }
                                      "namespaces" = {
                                        "description" = "namespaces specifies which namespaces the labelSelector applies to (matches against); null or empty list means \"this pod's namespace\""
                                        "items" = {
                                          "type" = "string"
                                        }
                                        "type" = "array"
                                      }
                                      "topologyKey" = {
                                        "description" = "This pod should be co-located (affinity) or not co-located (anti-affinity) with the pods matching the labelSelector in the specified namespaces, where co-located is defined as running on a node whose value of the label with key topologyKey matches that of any node on which any of the selected pods is running. Empty topologyKey is not allowed."
                                        "type" = "string"
                                      }
                                    }
                                    "required" = [
                                      "topologyKey",
                                    ]
                                    "type" = "object"
                                  }
                                  "weight" = {
                                    "description" = "weight associated with matching the corresponding podAffinityTerm, in the range 1-100."
                                    "format" = "int32"
                                    "type" = "integer"
                                  }
                                }
                                "required" = [
                                  "podAffinityTerm",
                                  "weight",
                                ]
                                "type" = "object"
                              }
                              "type" = "array"
                            }
                            "requiredDuringSchedulingIgnoredDuringExecution" = {
                              "description" = "If the affinity requirements specified by this field are not met at scheduling time, the pod will not be scheduled onto the node. If the affinity requirements specified by this field cease to be met at some point during pod execution (e.g. due to a pod label update), the system may or may not try to eventually evict the pod from its node. When there are multiple elements, the lists of nodes corresponding to each podAffinityTerm are intersected, i.e. all terms must be satisfied."
                              "items" = {
                                "description" = "Defines a set of pods (namely those matching the labelSelector relative to the given namespace(s)) that this pod should be co-located (affinity) or not co-located (anti-affinity) with, where co-located is defined as running on a node whose value of the label with key <topologyKey> matches that of any node on which a pod of the set of pods is running"
                                "properties" = {
                                  "labelSelector" = {
                                    "description" = "A label query over a set of resources, in this case pods."
                                    "properties" = {
                                      "matchExpressions" = {
                                        "description" = "matchExpressions is a list of label selector requirements. The requirements are ANDed."
                                        "items" = {
                                          "description" = "A label selector requirement is a selector that contains values, a key, and an operator that relates the key and values."
                                          "properties" = {
                                            "key" = {
                                              "description" = "key is the label key that the selector applies to."
                                              "type" = "string"
                                            }
                                            "operator" = {
                                              "description" = "operator represents a key's relationship to a set of values. Valid operators are In, NotIn, Exists and DoesNotExist."
                                              "type" = "string"
                                            }
                                            "values" = {
                                              "description" = "values is an array of string values. If the operator is In or NotIn, the values array must be non-empty. If the operator is Exists or DoesNotExist, the values array must be empty. This array is replaced during a strategic merge patch."
                                              "items" = {
                                                "type" = "string"
                                              }
                                              "type" = "array"
                                            }
                                          }
                                          "required" = [
                                            "key",
                                            "operator",
                                          ]
                                          "type" = "object"
                                        }
                                        "type" = "array"
                                      }
                                      "matchLabels" = {
                                        "additionalProperties" = {
                                          "type" = "string"
                                        }
                                        "description" = "matchLabels is a map of {key,value} pairs. A single {key,value} in the matchLabels map is equivalent to an element of matchExpressions, whose key field is \"key\", the operator is \"In\", and the values array contains only \"value\". The requirements are ANDed."
                                        "type" = "object"
                                      }
                                    }
                                    "type" = "object"
                                  }
                                  "namespaces" = {
                                    "description" = "namespaces specifies which namespaces the labelSelector applies to (matches against); null or empty list means \"this pod's namespace\""
                                    "items" = {
                                      "type" = "string"
                                    }
                                    "type" = "array"
                                  }
                                  "topologyKey" = {
                                    "description" = "This pod should be co-located (affinity) or not co-located (anti-affinity) with the pods matching the labelSelector in the specified namespaces, where co-located is defined as running on a node whose value of the label with key topologyKey matches that of any node on which any of the selected pods is running. Empty topologyKey is not allowed."
                                    "type" = "string"
                                  }
                                }
                                "required" = [
                                  "topologyKey",
                                ]
                                "type" = "object"
                              }
                              "type" = "array"
                            }
                          }
                          "type" = "object"
                        }
                        "podAntiAffinity" = {
                          "description" = "Describes pod anti-affinity scheduling rules (e.g. avoid putting this pod in the same node, zone, etc. as some other pod(s))."
                          "properties" = {
                            "preferredDuringSchedulingIgnoredDuringExecution" = {
                              "description" = "The scheduler will prefer to schedule pods to nodes that satisfy the anti-affinity expressions specified by this field, but it may choose a node that violates one or more of the expressions. The node that is most preferred is the one with the greatest sum of weights, i.e. for each node that meets all of the scheduling requirements (resource request, requiredDuringScheduling anti-affinity expressions, etc.), compute a sum by iterating through the elements of this field and adding \"weight\" to the sum if the node has pods which matches the corresponding podAffinityTerm; the node(s) with the highest sum are the most preferred."
                              "items" = {
                                "description" = "The weights of all of the matched WeightedPodAffinityTerm fields are added per-node to find the most preferred node(s)"
                                "properties" = {
                                  "podAffinityTerm" = {
                                    "description" = "Required. A pod affinity term, associated with the corresponding weight."
                                    "properties" = {
                                      "labelSelector" = {
                                        "description" = "A label query over a set of resources, in this case pods."
                                        "properties" = {
                                          "matchExpressions" = {
                                            "description" = "matchExpressions is a list of label selector requirements. The requirements are ANDed."
                                            "items" = {
                                              "description" = "A label selector requirement is a selector that contains values, a key, and an operator that relates the key and values."
                                              "properties" = {
                                                "key" = {
                                                  "description" = "key is the label key that the selector applies to."
                                                  "type" = "string"
                                                }
                                                "operator" = {
                                                  "description" = "operator represents a key's relationship to a set of values. Valid operators are In, NotIn, Exists and DoesNotExist."
                                                  "type" = "string"
                                                }
                                                "values" = {
                                                  "description" = "values is an array of string values. If the operator is In or NotIn, the values array must be non-empty. If the operator is Exists or DoesNotExist, the values array must be empty. This array is replaced during a strategic merge patch."
                                                  "items" = {
                                                    "type" = "string"
                                                  }
                                                  "type" = "array"
                                                }
                                              }
                                              "required" = [
                                                "key",
                                                "operator",
                                              ]
                                              "type" = "object"
                                            }
                                            "type" = "array"
                                          }
                                          "matchLabels" = {
                                            "additionalProperties" = {
                                              "type" = "string"
                                            }
                                            "description" = "matchLabels is a map of {key,value} pairs. A single {key,value} in the matchLabels map is equivalent to an element of matchExpressions, whose key field is \"key\", the operator is \"In\", and the values array contains only \"value\". The requirements are ANDed."
                                            "type" = "object"
                                          }
                                        }
                                        "type" = "object"
                                      }
                                      "namespaces" = {
                                        "description" = "namespaces specifies which namespaces the labelSelector applies to (matches against); null or empty list means \"this pod's namespace\""
                                        "items" = {
                                          "type" = "string"
                                        }
                                        "type" = "array"
                                      }
                                      "topologyKey" = {
                                        "description" = "This pod should be co-located (affinity) or not co-located (anti-affinity) with the pods matching the labelSelector in the specified namespaces, where co-located is defined as running on a node whose value of the label with key topologyKey matches that of any node on which any of the selected pods is running. Empty topologyKey is not allowed."
                                        "type" = "string"
                                      }
                                    }
                                    "required" = [
                                      "topologyKey",
                                    ]
                                    "type" = "object"
                                  }
                                  "weight" = {
                                    "description" = "weight associated with matching the corresponding podAffinityTerm, in the range 1-100."
                                    "format" = "int32"
                                    "type" = "integer"
                                  }
                                }
                                "required" = [
                                  "podAffinityTerm",
                                  "weight",
                                ]
                                "type" = "object"
                              }
                              "type" = "array"
                            }
                            "requiredDuringSchedulingIgnoredDuringExecution" = {
                              "description" = "If the anti-affinity requirements specified by this field are not met at scheduling time, the pod will not be scheduled onto the node. If the anti-affinity requirements specified by this field cease to be met at some point during pod execution (e.g. due to a pod label update), the system may or may not try to eventually evict the pod from its node. When there are multiple elements, the lists of nodes corresponding to each podAffinityTerm are intersected, i.e. all terms must be satisfied."
                              "items" = {
                                "description" = "Defines a set of pods (namely those matching the labelSelector relative to the given namespace(s)) that this pod should be co-located (affinity) or not co-located (anti-affinity) with, where co-located is defined as running on a node whose value of the label with key <topologyKey> matches that of any node on which a pod of the set of pods is running"
                                "properties" = {
                                  "labelSelector" = {
                                    "description" = "A label query over a set of resources, in this case pods."
                                    "properties" = {
                                      "matchExpressions" = {
                                        "description" = "matchExpressions is a list of label selector requirements. The requirements are ANDed."
                                        "items" = {
                                          "description" = "A label selector requirement is a selector that contains values, a key, and an operator that relates the key and values."
                                          "properties" = {
                                            "key" = {
                                              "description" = "key is the label key that the selector applies to."
                                              "type" = "string"
                                            }
                                            "operator" = {
                                              "description" = "operator represents a key's relationship to a set of values. Valid operators are In, NotIn, Exists and DoesNotExist."
                                              "type" = "string"
                                            }
                                            "values" = {
                                              "description" = "values is an array of string values. If the operator is In or NotIn, the values array must be non-empty. If the operator is Exists or DoesNotExist, the values array must be empty. This array is replaced during a strategic merge patch."
                                              "items" = {
                                                "type" = "string"
                                              }
                                              "type" = "array"
                                            }
                                          }
                                          "required" = [
                                            "key",
                                            "operator",
                                          ]
                                          "type" = "object"
                                        }
                                        "type" = "array"
                                      }
                                      "matchLabels" = {
                                        "additionalProperties" = {
                                          "type" = "string"
                                        }
                                        "description" = "matchLabels is a map of {key,value} pairs. A single {key,value} in the matchLabels map is equivalent to an element of matchExpressions, whose key field is \"key\", the operator is \"In\", and the values array contains only \"value\". The requirements are ANDed."
                                        "type" = "object"
                                      }
                                    }
                                    "type" = "object"
                                  }
                                  "namespaces" = {
                                    "description" = "namespaces specifies which namespaces the labelSelector applies to (matches against); null or empty list means \"this pod's namespace\""
                                    "items" = {
                                      "type" = "string"
                                    }
                                    "type" = "array"
                                  }
                                  "topologyKey" = {
                                    "description" = "This pod should be co-located (affinity) or not co-located (anti-affinity) with the pods matching the labelSelector in the specified namespaces, where co-located is defined as running on a node whose value of the label with key topologyKey matches that of any node on which any of the selected pods is running. Empty topologyKey is not allowed."
                                    "type" = "string"
                                  }
                                }
                                "required" = [
                                  "topologyKey",
                                ]
                                "type" = "object"
                              }
                              "type" = "array"
                            }
                          }
                          "type" = "object"
                        }
                      }
                      "type" = "object"
                    }
                    "fromPostgresVersion" = {
                      "description" = "The major version of PostgreSQL before the upgrade."
                      "maximum" = 14
                      "minimum" = 10
                      "type" = "integer"
                    }
                    "image" = {
                      "description" = "The image name to use for major PostgreSQL upgrades."
                      "type" = "string"
                    }
                    "imagePullPolicy" = {
                      "description" = "ImagePullPolicy is used to determine when Kubernetes will attempt to pull (download) container images. More info: https://kubernetes.io/docs/concepts/containers/images/#image-pull-policy"
                      "enum" = [
                        "Always",
                        "Never",
                        "IfNotPresent",
                      ]
                      "type" = "string"
                    }
                    "imagePullSecrets" = {
                      "description" = "The image pull secrets used to pull from a private registry. Changing this value causes all running PGUpgrade pods to restart. https://k8s.io/docs/tasks/configure-pod-container/pull-image-private-registry/"
                      "items" = {
                        "description" = "LocalObjectReference contains enough information to let you locate the referenced object inside the same namespace."
                        "properties" = {
                          "name" = {
                            "description" = "Name of the referent. More info: https://kubernetes.io/docs/concepts/overview/working-with-objects/names/#names TODO: Add other useful fields. apiVersion, kind, uid?"
                            "type" = "string"
                          }
                        }
                        "type" = "object"
                      }
                      "type" = "array"
                    }
                    "metadata" = {
                      "description" = "Metadata contains metadata for PGUpgrade"
                      "properties" = {
                        "annotations" = {
                          "additionalProperties" = {
                            "type" = "string"
                          }
                          "type" = "object"
                        }
                        "labels" = {
                          "additionalProperties" = {
                            "type" = "string"
                          }
                          "type" = "object"
                        }
                      }
                      "type" = "object"
                    }
                    "postgresClusterName" = {
                      "description" = "The name of the cluster to be updated"
                      "minLength" = 1
                      "type" = "string"
                    }
                    "priorityClassName" = {
                      "description" = "Priority class name for the PGUpgrade pod. Changing this value causes PGUpgrade pod to restart. More info: https://kubernetes.io/docs/concepts/scheduling-eviction/pod-priority-preemption/"
                      "type" = "string"
                    }
                    "resources" = {
                      "description" = "Resource requirements for the PGUpgrade container."
                      "properties" = {
                        "limits" = {
                          "additionalProperties" = {
                            "anyOf" = [
                              {
                                "type" = "integer"
                              },
                              {
                                "type" = "string"
                              },
                            ]
                            "pattern" = "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
                            "x-kubernetes-int-or-string" = true
                          }
                          "description" = "Limits describes the maximum amount of compute resources allowed. More info: https://kubernetes.io/docs/concepts/configuration/manage-compute-resources-container/"
                          "type" = "object"
                        }
                        "requests" = {
                          "additionalProperties" = {
                            "anyOf" = [
                              {
                                "type" = "integer"
                              },
                              {
                                "type" = "string"
                              },
                            ]
                            "pattern" = "^(\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))(([KMGTPE]i)|[numkMGTPE]|([eE](\\+|-)?(([0-9]+(\\.[0-9]*)?)|(\\.[0-9]+))))?$"
                            "x-kubernetes-int-or-string" = true
                          }
                          "description" = "Requests describes the minimum amount of compute resources required. If Requests is omitted for a container, it defaults to Limits if that is explicitly specified, otherwise to an implementation-defined value. More info: https://kubernetes.io/docs/concepts/configuration/manage-compute-resources-container/"
                          "type" = "object"
                        }
                      }
                      "type" = "object"
                    }
                    "toPostgresImage" = {
                      "description" = "The image name to use for PostgreSQL containers after upgrade. When omitted, the value comes from an operator environment variable."
                      "type" = "string"
                    }
                    "toPostgresVersion" = {
                      "description" = "The major version of PostgreSQL to be upgraded to."
                      "maximum" = 14
                      "minimum" = 10
                      "type" = "integer"
                    }
                    "tolerations" = {
                      "description" = "Tolerations of the PGUpgrade pod. More info: https://kubernetes.io/docs/concepts/scheduling-eviction/taint-and-toleration"
                      "items" = {
                        "description" = "The pod this Toleration is attached to tolerates any taint that matches the triple <key,value,effect> using the matching operator <operator>."
                        "properties" = {
                          "effect" = {
                            "description" = "Effect indicates the taint effect to match. Empty means match all taint effects. When specified, allowed values are NoSchedule, PreferNoSchedule and NoExecute."
                            "type" = "string"
                          }
                          "key" = {
                            "description" = "Key is the taint key that the toleration applies to. Empty means match all taint keys. If the key is empty, operator must be Exists; this combination means to match all values and all keys."
                            "type" = "string"
                          }
                          "operator" = {
                            "description" = "Operator represents a key's relationship to the value. Valid operators are Exists and Equal. Defaults to Equal. Exists is equivalent to wildcard for value, so that a pod can tolerate all taints of a particular category."
                            "type" = "string"
                          }
                          "tolerationSeconds" = {
                            "description" = "TolerationSeconds represents the period of time the toleration (which must be of effect NoExecute, otherwise this field is ignored) tolerates the taint. By default, it is not set, which means tolerate the taint forever (do not evict). Zero and negative values will be treated as 0 (evict immediately) by the system."
                            "format" = "int64"
                            "type" = "integer"
                          }
                          "value" = {
                            "description" = "Value is the taint value the toleration matches to. If the operator is Exists, the value should be empty, otherwise just a regular string."
                            "type" = "string"
                          }
                        }
                        "type" = "object"
                      }
                      "type" = "array"
                    }
                  }
                  "required" = [
                    "fromPostgresVersion",
                    "postgresClusterName",
                    "toPostgresVersion",
                  ]
                  "type" = "object"
                }
                "status" = {
                  "description" = "PGUpgradeStatus defines the observed state of PGUpgrade"
                  "properties" = {
                    "conditions" = {
                      "description" = "conditions represent the observations of PGUpgrade's current state."
                      "items" = {
                        "description" = <<-EOT
                        Condition contains details for one aspect of the current state of this API Resource. --- This struct is intended for direct use as an array at the field path .status.conditions.  For example, type FooStatus struct{ // Represents the observations of a foo's current state. // Known .status.conditions.type are: "Available", "Progressing", and "Degraded" // +patchMergeKey=type // +patchStrategy=merge // +listType=map // +listMapKey=type Conditions []metav1.Condition `json:"conditions,omitempty" patchStrategy:"merge" patchMergeKey:"type" protobuf:"bytes,1,rep,name=conditions"` 
                         // other fields }
                        EOT
                        "properties" = {
                          "lastTransitionTime" = {
                            "description" = "lastTransitionTime is the last time the condition transitioned from one status to another. This should be when the underlying condition changed.  If that is not known, then using the time when the API field changed is acceptable."
                            "format" = "date-time"
                            "type" = "string"
                          }
                          "message" = {
                            "description" = "message is a human readable message indicating details about the transition. This may be an empty string."
                            "maxLength" = 32768
                            "type" = "string"
                          }
                          "observedGeneration" = {
                            "description" = "observedGeneration represents the .metadata.generation that the condition was set based upon. For instance, if .metadata.generation is currently 12, but the .status.conditions[x].observedGeneration is 9, the condition is out of date with respect to the current state of the instance."
                            "format" = "int64"
                            "minimum" = 0
                            "type" = "integer"
                          }
                          "reason" = {
                            "description" = "reason contains a programmatic identifier indicating the reason for the condition's last transition. Producers of specific condition types may define expected values and meanings for this field, and whether the values are considered a guaranteed API. The value should be a CamelCase string. This field may not be empty."
                            "maxLength" = 1024
                            "minLength" = 1
                            "pattern" = "^[A-Za-z]([A-Za-z0-9_,:]*[A-Za-z0-9_])?$"
                            "type" = "string"
                          }
                          "status" = {
                            "description" = "status of the condition, one of True, False, Unknown."
                            "enum" = [
                              "True",
                              "False",
                              "Unknown",
                            ]
                            "type" = "string"
                          }
                          "type" = {
                            "description" = "type of condition in CamelCase or in foo.example.com/CamelCase. --- Many .condition.type values are consistent across resources like Available, but because arbitrary conditions can be useful (see .node.status.conditions), the ability to deconflict is important. The regex it matches is (dns1123SubdomainFmt/)?(qualifiedNameFmt)"
                            "maxLength" = 316
                            "pattern" = "^([a-z0-9]([-a-z0-9]*[a-z0-9])?(\\.[a-z0-9]([-a-z0-9]*[a-z0-9])?)*/)?(([A-Za-z0-9][-A-Za-z0-9_.]*)?[A-Za-z0-9])$"
                            "type" = "string"
                          }
                        }
                        "required" = [
                          "lastTransitionTime",
                          "message",
                          "reason",
                          "status",
                          "type",
                        ]
                        "type" = "object"
                      }
                      "type" = "array"
                      "x-kubernetes-list-map-keys" = [
                        "type",
                      ]
                      "x-kubernetes-list-type" = "map"
                    }
                    "observedGeneration" = {
                      "description" = "observedGeneration represents the .metadata.generation on which the status was based."
                      "format" = "int64"
                      "minimum" = 0
                      "type" = "integer"
                    }
                  }
                  "type" = "object"
                }
              }
              "type" = "object"
            }
          }
          "served" = true
          "storage" = true
          "subresources" = {
            "status" = {}
          }
        },
      ]
    }
  }
}

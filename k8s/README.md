/c/Users/Shlomo/Documents/devops-course-SV/k8s/svc/k8s/

## Mental Model
`kubectl` is a client that talks to the Kubernetes API server. Every command is one of:

- **Look at stuff** (read)
- **Make stuff** (create)
- **Change stuff** (update)
- **Delete stuff** (delete)
- **Get into stuff** (exec / logs / port-forward)

That's it. If you can place a command in one of those five buckets, you understand what it does.
Kind Deployment is the "reciept" of the pods and it responsible that the pods are up in other hand kind of port know just to run container not manage anything


---

## Cluster & Context (Orientation)

| Command | What it does | When you'd use it |
|---|---|---|
| `kubectl version` | Show client + server version | First sanity check on a new cluster |
| `kubectl cluster-info` | Show API server URL + core services | Confirm you're connected to *some* cluster |
| `kubectl config get-contexts` | List clusters/contexts in your kubeconfig | Check which clusters you have access to |
| `kubectl config current-context` | Show which cluster is active right now | Before running anything destructive |
| `kubectl config use-context <name>` | Switch the active cluster | Moving between local minikube and a real cluster |

---

## Looking at Resources (Read-Only — the Safe Ones)

| Command | What it does | When you'd use it |
|---|---|---|
| `kubectl get <resource>` | List objects of a type | `kubectl get pods`, `kubectl get nodes` |
| `kubectl get <resource> -o wide` | Same list, with extra columns (IP, node) | When you need to know which node a pod is on |
| `kubectl get <resource> <name> -o yaml` | Print the full YAML of an object | Inspect what's actually in the cluster |
| `kubectl describe <resource> <name>` | Human-readable detail + recent events | The first thing to run when something's broken |
| `kubectl get all` | List pods/services/deployments/replicasets in current namespace | Quick "what's running?" — note: doesn't include *everything* |
| `kubectl api-resources` | List every resource type the cluster knows about | When you forget the plural or short name |

---

## Namespaces (Every Read/Write Command Takes These)

| Command / Flag | What it does |
|---|---|
| `-n <namespace>` | Run against a specific namespace |
| `--all-namespaces` / `-A` | Run across every namespace |
| `kubectl get ns` | List all namespaces |
| `kubectl create ns <name>` | Create a namespace |

---

## Creating Resources

| Command | What it does | When you'd use it |
|---|---|---|
| `kubectl apply -f file.yaml` | Create or update from YAML (idempotent) | **The 95% command** — what you'll use most |
| `kubectl apply -f ./folder/` | Apply every YAML in a folder | Multi-file projects |
| `kubectl create <kind> <name>` | Imperatively create a resource | Quick deployments without writing YAML |
| `kubectl create -f file.yaml` | Create from YAML (fails if it exists) | Rare — prefer `apply` |
| `kubectl run <name> --image=<img>` | Quickly start a single Pod | Throwaway debug pods only |

---

## The "Give Me a YAML Template" Trick

Use this whenever you don't want to write a manifest from scratch.

```bash
kubectl create deployment web --image=nginx --dry-run=client -o yaml > deployment.yaml
kubectl create service clusterip web --tcp=80:80 --dry-run=client -o yaml > service.yaml
kubectl create configmap app-config --from-literal=ENV=prod --dry-run=client -o yaml > cm.yaml
kubectl run debug --image=busybox --dry-run=client -o yaml > pod.yaml
```

**What each flag does:**

- `--dry-run=client` — simulate locally; don't send to the API server
- `-o yaml` — output as YAML instead of a confirmation message
- `>` — redirect the YAML into a file

---

## Changing Resources

| Command | What it does | When you'd use it |
|---|---|---|
| `kubectl edit <resource> <name>` | Open the live object in your editor; save = apply | Quick fixes (Git is better long-term) |
| `kubectl scale deployment <name> --replicas=N` | Change replica count | Horizontal scaling |
| `kubectl set image deployment/<name> <container>=<img>` | Update the image of a deployment | Trigger a rolling update without editing YAML |
| `kubectl rollout status deployment/<name>` | Watch a rollout finish | After `set image` or re-applying |
| `kubectl rollout undo deployment/<name>` | Roll back to the previous version | When a deploy went bad |
| `kubectl label <resource> <name> key=value` | Add a label | Grouping/selecting objects |

---

## Deleting

| Command | What it does |
|---|---|
| `kubectl delete <resource> <name>` | Delete one object |
| `kubectl delete -f file.yaml` | Delete everything that file created |
| `kubectl delete <resource> --all -n <ns>` | Delete all objects of a kind in a namespace |
| `kubectl delete pod <name> --grace-period=0 --force` | Force-kill a stuck pod (last resort) |

---

## Debugging (Where You'll Live)

| Command | What it does | When you'd use it |
|---|---|---|
| `kubectl logs <pod>` | Print container logs | First step on a crashing app |
| `kubectl logs <pod> -f` | Follow logs live | Watching a startup |
| `kubectl logs <pod> --previous` | Logs from the *previous* container instance | Pod is in `CrashLoopBackOff` |
| `kubectl logs <pod> -c <container>` | Logs from a specific container | Multi-container pods / sidecars |
| `kubectl exec -it <pod> -- sh` | Open a shell *inside* the container | "Is this file actually there?" |
| `kubectl exec <pod> -- <cmd>` | Run a one-off command in the pod | `kubectl exec web-0 -- ls /etc/nginx` |
| `kubectl port-forward <pod> 8080:80` | Tunnel a local port → a container port | Test the app from your laptop without a Service |
| `kubectl get events --sort-by=.lastTimestamp` | Recent events across the namespace | When `describe` isn't enough |
| `kubectl top pods` / `kubectl top nodes` | Live CPU/RAM usage (needs metrics-server) | "Why is this slow?" |

---

## Help & Discovery (Don't Forget These Exist)

| Command | What it does |
|---|---|
| `kubectl <cmd> --help` | Help for any command |
| `kubectl explain <resource>` | Describe the YAML schema of a resource |
| `kubectl explain pod.spec.containers` | Drill into a specific field |

---

## Short Names Worth Memorizing

| Long form | Short form |
|---|---|
| `pods` | `po` |
| `services` | `svc` |
| `deployments` | `deploy` |
| `replicasets` | `rs` |
| `namespaces` | `ns` |
| `configmaps` | `cm` |
| `persistentvolumeclaims` | `pvc` |
| `ingresses` | `ing` |

---

## Common Gotchas

- **Forgetting `-n <namespace>`.** You run `kubectl get pods` and see "nothing" — because the pods live in a different namespace. Get used to `kubectl get pods -A`.
- **`apply` vs `create`.** `create` errors if the object exists. `apply` creates or updates. Prefer `apply`.
- **`kubectl run` is not for production.** It creates a bare Pod, not a Deployment. Use it only for one-off debug pods.
- **`get all` lies.** It doesn't include ConfigMaps, Secrets, Ingresses, or PVCs. Don't trust it as a full inventory.
- **`--dry-run=true` is deprecated.** Use `--dry-run=client` or `--dry-run=server`.
- **`kubectl edit` is invisible to Git.** Fine while learning; in a GitOps world it causes drift.

---

## When You're Stuck — The Standard Flowchart

```
Pod not running?
  → kubectl get pods                    (what state is it in?)
  → kubectl describe pod <name>         (read the Events section at the bottom)
  → kubectl logs <name>                 (did it start and then die?)
  → kubectl logs <name> --previous      (if CrashLoopBackOff)
```

That four-step sequence solves roughly 80% of beginner Kubernetes problems.

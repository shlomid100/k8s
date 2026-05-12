# 🧪 Practice 1 — Explore, Scale, and Break Your Deployment



**Goal:** Get comfortable inspecting pods, scaling a Deployment, and seeing self-healing with your own eyes.

> 📌 Throughout this exercise, replace `<your-namespace>` with the namespace you created in Practice 1. Or, save typing by running this once:
>
> ```bash
> kubectl config set-context --current --namespace=<your-namespace>
> ```
>
> After that, every `kubectl` command runs against your namespace automatically.

---

## Step 1 — See what's running

```bash
kubectl get pods
```

**Expected output:**

```
NAME                            READY   STATUS    RESTARTS   AGE
nginx-deployment-7d9c8b-abc12   1/1     Running   0          2m
nginx-deployment-7d9c8b-def34   1/1     Running   0          2m
nginx-deployment-7d9c8b-ghi56   1/1     Running   0          2m
```

✅ You should see **3 pods**. Each one is a copy of the same container.

❓ *Question to think about:* Why do all the pod names start with the same prefix?

---

## Step 2 — Look closer at one pod

Copy any pod name from the list above, then:

```bash
kubectl describe pod <paste-pod-name-here>
```

Scroll down to the **`Events:`** section at the bottom. You'll see lines like `Pulled image`, `Created container`, `Started container`.

> 💡 **Remember this.** The Events section at the bottom of `describe` is where Kubernetes tells you the story of what happened. It's the first place you look when something's broken.

---

## Step 3 — Read the application logs

```bash
kubectl logs <paste-pod-name-here>
```

You'll see nginx's startup messages — proof that the container actually started.

---

## Step 4 — Scale up to 5 copies

```bash
kubectl scale deployment nginx-deployment --replicas=5
```

Then check immediately:

```bash
kubectl get pods
```

✅ You should now see **5 pods**. Two of them might still be `ContainerCreating` for a few seconds — run the command again and watch them flip to `Running`.

---

## Step 5 — The magic moment: kill a pod 💥

Pick any pod from the list and delete it on purpose:

```bash
kubectl delete pod <paste-any-pod-name>
```

**Immediately** run:

```bash
kubectl get pods
```

✅ You'll still see **5 pods** — but one of them is brand new (look at the `AGE` column — one says `5s` while the others say `2m`).

🎯 **This is the whole point of a Deployment.** You declared "I want 5." You killed one. Kubernetes noticed and made a new one. You didn't have to do anything.

---

## Step 6 — Scale back down

```bash
kubectl scale deployment nginx-deployment --replicas=1
kubectl get pods
```

✅ Within a few seconds, only **1 pod** remains. The other 4 were terminated automatically.

---

## ✅ You're done if you can answer:

1. What command shows you the **list** of pods?
2. What command shows you the **details and events** of one pod?
3. What happens when you delete a pod that belongs to a Deployment?
4. What command **changes** the number of replicas without editing the YAML?

---

## 🌟 Bonus (for fast finishers)

Try this and observe carefully:

```bash
# Get a shell INSIDE one of the running containers
kubectl exec -it <pod-name> -- sh

# Once inside, try:
curl localhost:80
exit
```

You just talked to nginx from inside its own pod. Next session we'll learn how to talk to it from **outside** the cluster — that's what a Service is for.

# 🧪 Practice 1 — Tasks Only


**No commands are provided — figure them out yourself.**

---

## Tasks

1. Set your namespace as the default for the current context so you don't have to type `-n <your-namespace>` every time.

2. List all pods in your namespace.

3. Pick one pod. Show its **full details and recent events**.

4. Read the **logs** of that same pod.

5. Find out which **node** that pod is running on.

6. Scale the nginx deployment up to **5 replicas**.

7. Verify that 5 pods are running.

8. Delete one of the pods on purpose.

9. List the pods again immediately. Confirm there are still 5 pods, and identify which one is the **new** pod.
   Write down the answer: **how can you tell which pod is the new one?**

10. Scale the deployment back down to **1 replica**.

11. Verify only 1 pod remains.

12. Open a shell inside the running pod.

13. From inside the pod, make a request to nginx on port 80.

14. Exit the pod's shell.

---

## ✅ Done when

- Your namespace is set as the default context.
- The deployment is back to 1 replica.
- You can explain in one sentence what happened when you deleted a pod in task 8.

# 🧪 Practice — Tasks Only


**No commands are provided — figure them out yourself.**

---

## Tasks

1. Create 3 namespaces: `dev`, `test`, `prod`.

2. In each namespace, deploy nginx with a different replica count:
   - `dev` → 2 replicas
   - `test` → 3 replicas
   - `prod` → 5 replicas

3. List **all pods in all namespaces** in a single command.

4. Show only the pods that belong to the `prod` namespace.

5. Pick one pod in `dev`. Find out which **node** it's running on.

6. Scale the `prod` deployment down to **1 replica**.

7. Change the image of the `dev` deployment from `nginx:1.25` to `nginx:1.26`.

8. Watch the rollout of the `dev` deployment until it finishes.

9. Roll the `dev` deployment **back** to the previous image.

10. Open a shell inside one of the `test` pods. Create a file called `/tmp/hello.txt` with any content. Exit the shell.

11. Delete that same pod. After it gets replaced, open a shell in the new pod and check whether `/tmp/hello.txt` exists.
    Write down the answer: **does the file exist? Why or why not?**

12. Show the most recent **events** in the `dev` namespace, sorted by time.

13. Delete the `test` namespace entirely (with everything inside it).

14. Verify that the `test` namespace is gone.

---

## ✅ Done when

- Only `dev` and `prod` namespaces remain.
- `dev` is running the rolled-back image with 2 replicas.
- `prod` has 1 replica.
- You can explain in one sentence what happened to `/tmp/hello.txt` in task 11.

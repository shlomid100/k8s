# Python flask playbook
## Execute and Test playbook-flask.yml based on the app.py
- Create an app.py
- Create an  ansible playbook
- Run the flask playbook
- Test via browser

```
tee app.py > /dev/null <<EOF
from flask import Flask

app = Flask(__name__)

@app.route("/")
def home():
    return "Ansible Galaxy!"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5015)
EOF
```


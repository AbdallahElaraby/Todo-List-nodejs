# 📝 Todo List Node.js App with CI/CD

This repository contains the source code for a simple Todo List web application built using Node.js and MongoDB. It also includes a GitHub Actions pipeline that builds and pushes a Docker image to a docker hub registry and automatically updates a GitOps repository to trigger deployment via ArgoCD.

---

## 📦 Tech Stack

- **Backend**: Node.js, Express.js
- **Database**: MongoDB
- **Containerization**: Docker
- **CI/CD**: GitHub Actions
- **GitOps Integration**: Pushes updated image tags to a separate repository
    Link for GitOps repository

---

## 📁 Project Structure

```
todo-list-nodejs/
├── public/                  # Static files
├── routes/                  # Express routes
├── views/                   # EJS templates
├── .env.example             # Environment variable template
├── app.js                   # Main app entry point
├── Dockerfile               # Docker build configuration
├── .github/workflows/ci.yml# GitHub Actions CI pipeline
├── package.json
└── README.md
```

---


## 🚀 Features

- Add, update, and delete todos
- Uses a remote or local MongoDB database
- Responsive frontend with EJS templating
- Automatically builds and pushes Docker images via GitHub Actions

---

## ⚙️ Environment Setup

1. **Clone the repository**

```bash
git clone https://github.com/AbdallahElaraby/Todo-List-nodejs.git
cd Todo-List-nodejs/src
```

2. **Install dependencies**

```bash
npm install
```

3. **Set environment variables**

Create a `.env` file based on `.env.example`:

```env
PORT=5000
MONGO_URI=mongodb+srv://<user>:<password>@cluster.mongodb.net/todo-app
```

4. **Run locally**

```bash
npm start
```

Then visit `http://localhost:5000`.

---

## 🐳 Dockerization

### Build and Run

```bash
docker build -t your-registry/your-username/myapp:latest .
docker run -p 5000:5000 --env-file .env your-registry/your-username/myapp:latest
```

---

## 🔄 CI/CD Pipeline (GitHub Actions)

Whenever you push code to the main branch, the GitHub Actions workflow:

1. Builds a Docker image tagged with the commit SHA
2. Pushes the image to a **private Docker registry**
3. Updates a **separate GitOps repository** to reflect the new image version (triggering ArgoCD deployment)

### Secrets and variables Required

Set these secrets and variables in your GitHub repository:

- `CONTAINER_REGISTRY` — Container Registry name
- `DOCKER_USERNAME` — Docker Username
- `DOCKER_Password` — URL of the GitOps repo
- `GITOPS_PAT` — GitHub token with push access to GitOps repo

---

## 🔁 GitOps Integration

The workflow automatically clones a separate GitOps repo (which contains your Helm chart or manifest files) and updates the image tag for the Todo app.

Example update logic:
```yaml
image:
  repository: your-registry/todo-list-nodejs
  tag: <latest-sha>
```

ArgoCD running on the K8s cluster detects the change and updates the deployment accordingly.

---

## ✅ Future Enhancements

- Add unit testing (Jest)
- Add GitHub Action for code linting
- Add vulnerability scanning (Trivy)
- Rate limiting and authentication for production

---

## 📝 License

MIT License.  
© 2025 Abdallah Elaraby

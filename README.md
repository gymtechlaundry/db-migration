# db-migration

🚀 A lightweight Spring Boot service that runs [Flyway](https://flywaydb.org/) database migrations for the `portfolio-db` MySQL instance. Designed for CI/CD automation with Docker, GitHub Actions, and Kubernetes via Helm.

---

## 📦 Project Structure

- `src/main/resources/db/migration` — Flyway `.sql` scripts (V1__init.sql, V2__add_table.sql, etc.)
- `Dockerfile` — Multi-stage build for small runtime image
- `values.yaml` — Helm values to parameterize deployments
- `.github/workflows/deploy.yaml` — CI/CD pipeline that builds, pushes, and deploys migrations

---

## 🔧 Local Development

### 1. Run Migrations Locally

```bash
./gradlew clean build
java -jar build/libs/db-migration.jar
```

Make sure your local database config matches the `application.yml`.

---

## 🐳 Docker Usage

### Build Image

```bash
docker build -t ghcr.io/<your-username>/db-migration:latest .
```

### Run Migration

```bash
docker run --rm \
  -e SPRING_DATASOURCE_URL=jdbc:mysql://<host>:3306/<db> \
  -e SPRING_DATASOURCE_USERNAME=<user> \
  -e SPRING_DATASOURCE_PASSWORD=<pass> \
  ghcr.io/<your-username>/db-migration:latest
```

---

## 🚀 GitHub Actions CI/CD

On every push to `main`:

1. Builds a new Docker image using `docker/build-push-action`
2. Tags with `:latest` and Git SHA
3. Deploys to your Kubernetes cluster via Helm
4. Waits for Flyway migration job to complete
5. Rolls back on failure

### Environment Variables & Secrets

| Name | Description |
|------|-------------|
| `GHCR_PAT` | GitHub PAT with `write:packages` for pushing images |
| `K3S_HOST` | IP or domain of your k3s server |
| `K3S_USER` | SSH username for deployment |
| `K3S_SSH_KEY` | SSH private key for accessing k3s |
| `HELM_REPO_DEPLOY_KEY` | SSH key to pull Helm charts from `helm-values` repo |

---

## 🪖 Helm Deployment

```bash
helm upgrade --install db-migration \
  ./charts/db-migration \
  --namespace devincooper \
  --create-namespace \
  --set image.repository=ghcr.io/your-username/db-migration \
  --set image.tag=latest \
  --set jobName=db-migration-latest
```

---

## 📁 Example Migration File

```sql
-- V1__create_users_table.sql
CREATE TABLE users (
  id BIGINT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(255),
  email VARCHAR(255) UNIQUE
);
```

---

## 🧪 Testing Migrations

You can run migrations against a test DB using Docker Compose or a test container. Ensure Flyway detects and applies all scripts correctly in CI before pushing to production.

---

## 🤝 Contributing

Pull requests welcome. Be sure to keep SQL scripts **idempotent** and follow the naming convention:  
`V<version>__<description>.sql`

---

## 📜 License

MIT License © 2025 Devin Cooper
